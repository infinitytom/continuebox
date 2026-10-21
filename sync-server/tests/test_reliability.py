import asyncio
import json
import time
from types import SimpleNamespace

import pytest
from fastapi import HTTPException
from fastapi.testclient import TestClient
from starlette.requests import Request

import app.main as main


@pytest.fixture(autouse=True)
def isolated_db(tmp_path, monkeypatch):
    monkeypatch.setattr(main, "DB_PATH", tmp_path / "test.db")
    monkeypatch.setattr(main, "DATA_DIR", tmp_path)
    main.startup()


def test_comment_redirect_strips_credentials(monkeypatch):
    calls = []

    def request(method, url, **kwargs):
        calls.append((url, kwargs))
        if len(calls) == 1:
            return SimpleNamespace(status=302, headers={"Location": "https://cdn.example/comments"}, data=b"html")
        return SimpleNamespace(status=200, headers={}, data=b'{"comments": []}')

    monkeypatch.setattr(main, "pool_for", lambda _: SimpleNamespace(request=request))
    status, payload = main.json_request("GET", "https://api.example/comments", headers={
        "X-AppSecret": "secret", "X-AppId": "app", "Authorization": "Bearer test"})
    assert status == 200 and payload == {"comments": []}
    assert calls[1][1]["headers"] == {"Accept": "application/json"}
    assert calls[0][1]["redirect"] is False


@pytest.mark.parametrize("payload", [{"success": False}, {"comments": "bad"}, []])
def test_bad_comment_response_does_not_poison_cache(monkeypatch, payload):
    monkeypatch.setattr(main, "dandan_headers", lambda _: {})
    monkeypatch.setattr(main, "json_request", lambda *a, **k: (200, payload))
    with pytest.raises(HTTPException):
        main.dandan_comments(123)
    assert main.cached_json("dandan:comments:123") == (None, None)
    old = {"comments": [{"p": "1,1,16777215,u", "m": "cached"}]}
    main.save_cached_json_for("dandan:comments:123", old, 1)
    with main.db() as conn:
        conn.execute("UPDATE metadata_cache SET expires_at=0")
    assert main.dandan_comments(123) == (old, True)


def test_empty_comments_retry_soon(monkeypatch):
    monkeypatch.setattr(main, "dandan_headers", lambda _: {})
    monkeypatch.setattr(main, "json_request", lambda *a, **k: (200, {"comments": []}))
    main.dandan_comments(124)
    _, expiry = main.cached_json("dandan:comments:124")
    assert 0 < expiry - time.time() <= 60


def test_old_poisoned_comment_cache_is_replaced(monkeypatch):
    main.save_cached_json_for("dandan:comments:125", {"success": False}, 21600)
    monkeypatch.setattr(main, "dandan_headers", lambda _: {})
    monkeypatch.setattr(main, "json_request", lambda *a, **k: (200, {"comments": []}))
    assert main.dandan_comments(125) == ({"comments": []}, False)


def test_title_match_does_not_wait_for_tmdb_and_checks_all_candidates(monkeypatch):
    def forbidden(*args):
        raise AssertionError("TMDB should not be needed")
    monkeypatch.setattr(main, "resolve_tmdb_id_by_title", forbidden)
    monkeypatch.setattr(main, "dandan_search_animes", lambda *a: [
        {"animeTitle": "测试", "episodes": [{"episodeId": 10001, "episodeTitle": "第1集"}]},
        {"animeTitle": "测试", "episodes": [{"episodeId": 20002, "episodeTitle": "第2集"}]},
    ])
    result = main.resolve_dandan_episode("测试", "第2集")
    assert result["dandan_episode_id"] == 20002


def test_one_character_title_is_searchable():
    assert main.dandan_title_variants("龙") == ["龙"]
    assert main.dandan_title_score({"animeTitle": ""}, ["龙"]) == 0


@pytest.mark.parametrize("english_failure", [False, True])
def test_partial_metadata_is_not_cached_for_a_month(monkeypatch, english_failure):
    def request(path, params=None):
        if "/search/" in path:
            return {"results": [{"id": 9, "name": "测试", "media_type": "tv"}]}
        if "/season/" in path:
            if not english_failure or params["language"] == "en-US":
                raise HTTPException(502, "offline")
            return {"episodes": [{"episode_number": 1, "name": "", "overview": "已有简介"}]}
        return {"id": 9, "name": "测试", "overview": "简介"}
    monkeypatch.setattr(main, "tmdb_request", request)
    monkeypatch.setattr(main, "TMDB_LANGUAGE", "zh-CN")
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "partial", "password": "password12345"})
        response = client.get("/api/v1/meta/title", params={"name": "测试"},
                              headers={"Authorization": "Bearer " + auth.json()["token"]})
    assert response.status_code == 200
    assert response.json()["partial"] is True
    if english_failure:
        assert response.json()["episodes"][0]["overview"] == "已有简介"
    with main.db() as conn:
        row = conn.execute("SELECT expires_at FROM metadata_cache WHERE cache_key LIKE 'title:%'").fetchone()
    assert 0 < row[0] - time.time() <= 60


class Stream:
    def __init__(self, status=206):
        self.status = status
        self.headers = {"Content-Type": "video/mp4", "Content-Length": "2048",
                        "Content-Range": "bytes 0-2047/4096", "Accept-Ranges": "bytes"}
        self.closed = self.released = False
        self.parts = iter([b"x" * 1024, b"y" * 1024, b""])

    def read1(self, size, decode_content):
        assert size == 65536 and decode_content is False
        return next(self.parts)

    def close(self):
        self.closed = True

    def release_conn(self):
        self.released = True


@pytest.mark.parametrize("method,status", [("GET", 206), ("HEAD", 206), ("GET", 416)])
def test_video_keeps_range_and_is_never_gzipped(monkeypatch, method, status):
    stream = Stream(status)
    monkeypatch.setattr(main, "verify_emby_signature", lambda *a: None)
    monkeypatch.setattr(main, "emby_account", lambda *a: {"base_url": "http://emby", "user_id": "u"})
    monkeypatch.setattr(main, "open_emby_stream", lambda *a: stream)
    with TestClient(main.app) as client:
        response = client.request(method, "/api/v1/emby/stream/video?uid=1&exp=1&sig=test&ms=m",
                                  headers={"Range": "bytes=0-2047", "Accept-Encoding": "gzip"})
    assert response.status_code == status
    assert response.headers["content-range"] == stream.headers["Content-Range"]
    assert "content-encoding" not in response.headers
    if method == "GET" and status == 206:
        assert response.content == b"x" * 1024 + b"y" * 1024
    assert stream.closed and stream.released


def test_stream_closed_when_client_send_fails():
    stream = Stream()
    response = main.VideoStreamResponse(stream)

    async def fail_send(message):
        raise RuntimeError("client disconnected")

    async def receive():
        return {"type": "http.disconnect"}

    with pytest.raises(RuntimeError):
        asyncio.run(response({"type": "http", "asgi": {"spec_version": "2.4"}}, receive, fail_send))
    assert stream.closed and stream.released
