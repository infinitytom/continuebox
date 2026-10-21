import json
import pytest
from fastapi import HTTPException
from app import main, danmaku_public as public
from test_security import env, login


def test_public_id_cannot_forward_private_links_or_secrets():
    assert public.normalize_id("http://127.0.0.1/admin?token=secret") == ""
    assert public.normalize_id("https://v.qq.com.evil.example/x/cover/a.html") == ""
    assert public.normalize_id("https://user:secret@v.qq.com/x/cover/a.html") == ""
    assert public.normalize_id("https://v.qq.com:443/x/cover/a.html") == ""
    assert public.normalize_id("A" * 32) == "a" * 32
    assert public.normalize_id("https://v.qq.com/x/page/abc.html?token=secret&vid=xyz#password") == "https://v.qq.com/x/page/abc.html?vid=xyz"


def test_xml_normalization_deduplication_and_entity_rejection():
    raw = b'<i><d p="1,0,25,16777215">same</d><d p="1,1,25,16777215">same</d><d p="2,999,25,1">bad</d></i>'
    xml = main.comments_xml({"comments": public.parse_xml(raw)})
    assert xml.count("<d ") == 1
    with pytest.raises(ValueError):
        public.parse_xml(b'<!DOCTYPE i [<!ENTITY e "secret">]><i><d>&e;</d></i>')
    with pytest.raises(ValueError):
        public.parse_xml(b"x" * (public.MAX_BYTES + 1))


def test_public_fetch_is_bounded_unauthenticated_and_cached(env, monkeypatch):
    calls = []
    class Response:
        status = 200
        def read(self, size):
            assert size == public.MAX_BYTES + 1
            return b'<i><d p="2,0,25,16777215">public</d></i>'
        def close(self): pass
        def release_conn(self): pass
    def request(method, url, **kwargs):
        calls.append(url)
        assert url.startswith(public.BASE)
        assert "Authorization" not in kwargs["headers"] and "Cookie" not in kwargs["headers"]
        assert kwargs["redirect"] is False and kwargs["preload_content"] is False
        return Response()
    monkeypatch.setattr(public.POOL, "request", request)
    first = public.fetch("a" * 32, main)
    second = public.fetch("a" * 32, main)
    assert first[0][0]["m"] == "public" and second[1] is True
    assert len(calls) == 1


def test_public_source_survives_dandan_failure_and_dedupes_local(env, monkeypatch):
    client, _ = env
    auth = login(client)
    def no_match(*args): raise HTTPException(404, "no match")
    monkeypatch.setattr(main, "account_danmaku_identity", no_match)
    monkeypatch.setattr(public, "fetch", lambda *args: ([{"p": "1,1,16777215,public", "m": "same"}], False, ""))
    monkeypatch.setattr(main, "local_danmaku_comments", lambda *args: [{"p": "1,1,16777215,local", "m": "same"}])
    r = client.get("/api/v1/danmaku/comments", params={"title": "Example", "source_id": "a" * 32}, headers=auth)
    assert r.status_code == 200
    data = r.json()
    assert data["count"] == 1 and data["sources"]["public"]["count"] == 1
    assert data["match_error"] == "no match"
    ass = client.get("/api/v1/danmaku/comments.ass", params={"title": "Example", "source_id": "a" * 32}, headers=auth)
    assert ass.status_code == 200 and "same" in ass.text


def test_public_failure_keeps_existing_sources(env, monkeypatch):
    client, _ = env
    monkeypatch.setattr(main, "account_danmaku_identity", lambda *args: {
        "identity_key": "test", "dandan_episode_id": 5, "dandan_title": "Example", "match_confidence": 100})
    monkeypatch.setattr(main, "dandan_comments", lambda *args: ({"comments": [{"p": "2,1,123,user", "m": "dandan"}]}, False))
    monkeypatch.setattr(public, "fetch", lambda *args: ([], False, "公共弹幕暂时不可用"))
    r = client.get("/api/v1/danmaku/comments", params={"title": "Example"}, headers=login(client))
    assert r.status_code == 200 and r.json()["count"] == 1
    assert r.json()["sources"]["public"]["error"]
