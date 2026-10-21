import importlib
import os
import sqlite3

os.environ["TOKEN_SECRET"] = "test-secret-that-is-at-least-32-characters"

from fastapi.testclient import TestClient
import app.main as main
import app.configure_emby as configure_emby


def test_optional_env_ignores_sample_placeholders(monkeypatch):
    monkeypatch.setenv("DANDAN_APP_ID", "请填写弹弹play开放弹幕网络AppId")
    monkeypatch.setenv("DANDAN_APP_SECRET", "your_app_secret")
    assert main.optional_env("DANDAN_APP_ID") == ""
    assert main.optional_env("DANDAN_APP_SECRET") == ""


def test_local_reviews_roundtrip(tmp_path):
    main.DB_PATH = tmp_path / "reviews.db"
    main.startup()
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register",
                           json={"username": "reviewer", "password": "password12345"})
        assert auth.status_code == 201
        assert "membership" not in auth.json()
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        posted = client.post("/api/v1/reviews", headers=headers, json={
            "source": "local", "media_type": "movie", "title": "测试电影", "year": 2026,
            "text": "服务器本地评论", "rating": 8
        })
        assert posted.status_code == 201
        assert posted.json()["storage"] == "server_local"
        reviews = client.get("/api/v1/reviews?title=测试电影&year=2026&media_type=movie", headers=headers)
        assert reviews.status_code == 200
        item = next(i for i in reviews.json()["items"] if i["text"] == "服务器本地评论")
        assert item["author"] == "reviewer"
        # 自部署版本没有会员门槛：注册即可用全部同步接口。
        assert client.get("/api/v1/sync/pull-v2?after=0", headers=headers).status_code == 200


def test_register_push_pull(tmp_path):
    main.DB_PATH = tmp_path / "test.db"
    main.startup()
    with TestClient(main.app) as client:
        health = client.get("/health").json()
        assert health["version"] == main.APP_VERSION
        assert "cross_source_progress" in health["features"]
        assert "tmdb_metadata" in health["features"]
        assert "tmdb_recommendations" in health["features"]
        assert "tmdb_organization_works" in health["features"]
        assert "dandan_danmaku" in health["features"]
        assert "trakt_device_auth" in health["features"]
        assert "neodb_shelf_sync" in health["features"]
        assert "account_settings_sync" in health["features"]
        assert "media_reviews" in health["features"]
        assert "emby_playback_checkins" in health["features"]
        auth = client.post("/api/v1/auth/register", json={"username": "tester", "password": "password12345"})
        assert auth.status_code == 201
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        pushed = client.post("/api/v1/sync/push", headers=headers, json={
            "device_id": "living-room",
            "records": [{"source_key": "same-source", "video_id": "v1", "episode_id": "e1",
                         "video_name": "测试", "position_ms": 12000, "duration_ms": 60000,
                         "progress_key": "same-sourcev1e1Episode 1", "updated_at": 1700000000000}]
        })
        assert pushed.status_code == 200
        assert pushed.json()["accepted"] == 1
        pulled = client.get("/api/v1/sync/pull?since=0", headers=headers)
        assert pulled.status_code == 200
        assert pulled.json()["records"][0]["position_ms"] == 12000
        assert pulled.json()["records"][0]["progress_key"] == "same-sourcev1e1Episode 1"

        # Progress frames for the same episode are newer logical updates, not retries.
        advanced = client.post("/api/v1/sync/push", headers=headers, json={
            "device_id": "living-room",
            "records": [{"source_key": "same-source", "video_id": "v1", "episode_id": "e1",
                         "position_ms": 24000, "updated_at": 1700000005000}]
        })
        assert advanced.json()["accepted"] == 1
        latest = client.get("/api/v1/sync/pull-v2?after=0", headers=headers).json()["records"][-1]
        assert latest["position_ms"] == 24000


def test_history_is_strictly_isolated_between_accounts(tmp_path):
    main.DB_PATH = tmp_path / "account-isolation.db"
    main.DATA_DIR = tmp_path
    main.startup()
    with TestClient(main.app) as client:
        first = client.post("/api/v1/auth/register",
                            json={"username": "historyone", "password": "password12345"})
        second = client.post("/api/v1/auth/register",
                             json={"username": "historytwo", "password": "password12345"})
        first_headers = {"Authorization": "Bearer " + first.json()["token"]}
        second_headers = {"Authorization": "Bearer " + second.json()["token"]}
        pushed = client.post("/api/v1/sync/push", headers=first_headers, json={
            "device_id": "first-tv",
            "records": [{"source_key": "private-source", "video_id": "only-first",
                         "episode_id": "episode-1", "video_name": "private-history",
                         "position_ms": 42000, "updated_at": 1700000000000}],
        })
        assert pushed.status_code == 200 and pushed.json()["accepted"] == 1
        assert len(client.get("/api/v1/sync/pull-v2?after=0", headers=first_headers).json()["records"]) == 1
        assert client.get("/api/v1/sync/pull-v2?after=0", headers=second_headers).json()["records"] == []


def test_dashboard_exposes_aggregate_stats_only(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "dashboard.db"
    main.DATA_DIR = tmp_path
    main.startup()
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register",
                           json={"username": "dashboarduser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        client.post("/api/v1/sync/push", headers=headers, json={
            "device_id": "dashboard-tv",
            "records": [{"source_key": "source", "video_id": "secret-title",
                         "episode_id": "e1", "video_name": "不应出现在统计中",
                         "position_ms": 1000, "updated_at": 1700000000000}],
        })
        assert client.get("/api/v1/stats").status_code == 401
        monkeypatch.setenv("ADMIN_USERNAMES", "dashboarduser")
        stats = client.get("/api/v1/stats", headers=headers)
        assert stats.status_code == 200
        assert stats.json()["users"] == 1 and stats.json()["history"] == 1
        assert "dashboarduser" not in stats.text and "不应出现在统计中" not in stats.text
        page = client.get("/dashboard")
        assert page.status_code == 200 and "登录管理员账号" in page.text


def test_account_settings_are_encrypted_versioned_and_user_scoped(tmp_path):
    main.DB_PATH = tmp_path / "account-settings.db"
    main.DATA_DIR = tmp_path
    main.startup()
    with TestClient(main.app) as client:
        first = client.post("/api/v1/auth/register",
                            json={"username": "settingsone", "password": "password12345"})
        second = client.post("/api/v1/auth/register",
                             json={"username": "settingstwo", "password": "password12345"})
        first_headers = {"Authorization": "Bearer " + first.json()["token"]}
        second_headers = {"Authorization": "Bearer " + second.json()["token"]}
        snapshot = '{"crypto":{"cipher_key":"secret-key"},"hawk":{"api_url":"encrypted-value"},"schema":1}'
        digest = main.hashlib.sha256(snapshot.encode()).hexdigest()

        empty = client.get("/api/v1/account/settings", headers=first_headers)
        assert empty.json() == {"exists": False, "revision": 0}
        stored = client.put("/api/v1/account/settings", headers=first_headers, json={
            "snapshot": snapshot, "snapshot_hash": digest, "base_revision": 0,
            "device_id": "living-room",
        })
        assert stored.status_code == 200
        assert stored.json()["revision"] == 1
        pulled = client.get("/api/v1/account/settings", headers=first_headers).json()
        assert pulled["snapshot"] == snapshot
        assert pulled["snapshot_hash"] == digest
        assert pulled["device_id"] == "living-room"
        assert client.get("/api/v1/account/settings", headers=second_headers).json()["exists"] is False

        with sqlite3.connect(main.DB_PATH) as conn:
            encrypted = conn.execute("SELECT encrypted_snapshot FROM account_settings").fetchone()[0]
        assert snapshot not in encrypted
        assert "secret-key" not in encrypted

        changed = snapshot.replace("encrypted-value", "new-encrypted-value")
        changed_hash = main.hashlib.sha256(changed.encode()).hexdigest()
        conflict = client.put("/api/v1/account/settings", headers=first_headers, json={
            "snapshot": changed, "snapshot_hash": changed_hash, "base_revision": 0,
        })
        assert conflict.status_code == 409
        bad_hash = client.put("/api/v1/account/settings", headers=first_headers, json={
            "snapshot": changed, "snapshot_hash": "0" * 64, "base_revision": 1,
        })
        assert bad_hash.status_code == 400


def test_cross_source_fingerprint_round_trip_and_migration(tmp_path):
    main.DB_PATH = tmp_path / "cross-source.db"
    main.DATA_DIR = tmp_path
    # Simulate the records table created by server 0.1 before starting 0.2.
    with sqlite3.connect(main.DB_PATH) as conn:
        conn.execute("""CREATE TABLE records (
          user_id INTEGER NOT NULL, record_key TEXT NOT NULL, source_key TEXT NOT NULL,
          video_id TEXT NOT NULL, video_name TEXT NOT NULL DEFAULT '', episode_id TEXT NOT NULL DEFAULT '',
          episode_name TEXT NOT NULL DEFAULT '', position_ms INTEGER NOT NULL DEFAULT 0,
          duration_ms INTEGER NOT NULL DEFAULT 0, client_updated_at INTEGER NOT NULL,
          server_updated_at INTEGER NOT NULL, deleted INTEGER NOT NULL DEFAULT 0,
          device_id TEXT NOT NULL, data_json TEXT NOT NULL DEFAULT '', progress_key TEXT NOT NULL DEFAULT '',
          PRIMARY KEY(user_id, record_key))""")
    main.startup()
    with sqlite3.connect(main.DB_PATH) as conn:
        columns = {row[1] for row in conn.execute("PRAGMA table_info(records)")}
    assert {"content_key", "content_year", "episode_key"}.issubset(columns)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "crosssource", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        content_key = "a" * 64
        pushed = client.post("/api/v1/sync/push", headers=headers, json={
            "device_id": "living-room",
            "records": [
                {"source_key": "source-a", "video_id": "a-101", "video_name": "Example Show",
                 "episode_id": "line-a#0", "episode_name": "第1集", "position_ms": 12000,
                 "updated_at": 1700000000100, "content_key": content_key,
                 "content_year": 2025, "episode_key": "episode:1"},
                {"source_key": "source-b", "video_id": "b-901", "video_name": "Example Show",
                 "episode_id": "line-b#0", "episode_name": "EP01", "position_ms": 30000,
                 "updated_at": 1700000000200, "content_key": content_key,
                 "content_year": 2025, "episode_key": "episode:1"},
            ],
        })
        assert pushed.status_code == 200
        records = client.get("/api/v1/sync/pull-v2?after=0", headers=headers).json()["records"]
        assert len(records) == 2
        assert {r["content_key"] for r in records} == {content_key}
        assert {r["episode_key"] for r in records} == {"episode:1"}
        assert max(r["position_ms"] for r in records) == 30000


def test_sequence_cursor_returns_writes_with_same_server_time(tmp_path):
    main.DB_PATH = tmp_path / "sequence.db"
    main.startup()
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "sequence", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        pushed = client.post("/api/v1/sync/push", headers=headers, json={
            "device_id": "bedroom",
            "records": [
                {"source_key": "source", "video_id": "one", "episode_id": "e1", "updated_at": 1700000000001},
                {"source_key": "source", "video_id": "two", "episode_id": "e1", "updated_at": 1700000000002},
            ],
        })
        assert pushed.status_code == 200
        pulled = client.get("/api/v1/sync/pull-v2?after=0", headers=headers)
        assert pulled.status_code == 200
        assert {item["video_id"] for item in pulled.json()["records"]} == {"one", "two"}
        assert pulled.json()["cursor"] > 0


def test_playback_change_journal_is_compacted_and_legacy_rows_are_coalesced(tmp_path):
    main.DB_PATH = tmp_path / "journal.db"
    main.startup()
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "journal", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        base = int(main.time.time() * 1000) - 10000
        for index in range(5):
            pushed = client.post("/api/v1/sync/push", headers=headers, json={
                "device_id": "tv-a", "records": [{
                    "source_key": "source", "video_id": "one", "episode_id": "line#0",
                    "position_ms": (index + 1) * 1500, "updated_at": base + index,
                }]})
            assert pushed.status_code == 200
        with main.db() as conn:
            user_id = conn.execute("SELECT id FROM users WHERE username='journal'").fetchone()["id"]
            assert conn.execute("SELECT COUNT(*) AS n FROM sync_changes WHERE user_id=?", (user_id,)).fetchone()["n"] == 1

        client.post("/api/v1/sync/push", headers=headers, json={
            "device_id": "tv-a", "records": [{
                "source_key": "source", "video_id": "two", "episode_id": "line#0",
                "position_ms": 3000, "updated_at": base + 100,
            }]})
        with main.db() as conn:
            key = conn.execute("SELECT record_key FROM records WHERE user_id=? AND video_id='one'", (user_id,)).fetchone()["record_key"]
            conn.executemany("INSERT INTO sync_changes(user_id,record_key,server_updated_at) VALUES(?,?,?)",
                             [(user_id, key, base + 200 + i) for i in range(700)])
        first = client.get("/api/v1/sync/pull-v2", headers=headers, params={"after": 0, "limit": 1}).json()
        assert first["has_more"] is True and len(first["records"]) == 1
        second = client.get("/api/v1/sync/pull-v2", headers=headers,
                            params={"after": first["cursor"], "limit": 1}).json()
        assert second["has_more"] is False and len(second["records"]) == 1
        assert {first["records"][0]["video_id"], second["records"][0]["video_id"]} == {"one", "two"}
        main.startup()
        with main.db() as conn:
            assert conn.execute("SELECT COUNT(*) AS n FROM sync_changes WHERE user_id=?", (user_id,)).fetchone()["n"] == 2


def test_tmdb_title_and_person_metadata_are_cached(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "metadata.db"
    main.DATA_DIR = tmp_path
    main.startup()
    calls = []

    def fake_tmdb(path, params=None):
        calls.append(path)
        if path == "/3/search/multi":
            return {"results": [{"id": 10, "media_type": "movie", "title": "示例电影",
                                  "release_date": "2025-01-01", "popularity": 8}]}
        if path == "/3/movie/10":
            return {"id": 10, "title": "示例电影", "overview": "简介",
                    "backdrop_path": "/backdrop.jpg",
                    "recommendations": {"results": [
                        {"id": 11, "title": "相关推荐", "release_date": "2024-01-01",
                         "poster_path": "/related.jpg", "vote_average": 8.3}
                    ]}, "similar": {"results": []}, "credits": {
                "cast": [{"id": 20, "name": "示例演员", "character": "主角",
                          "profile_path": "/person.jpg"}],
                "crew": [{"id": 30, "name": "示例导演", "job": "Director"}]}}
        if path == "/3/person/20":
            return {"id": 20, "name": "示例演员", "biography": "人物简介",
                    "profile_path": "/person.jpg", "combined_credits": {"cast": [
                        {"id": 10, "media_type": "movie", "title": "示例电影",
                         "release_date": "2025-01-01", "poster_path": "/poster.jpg",
                         "character": "主角", "popularity": 8}], "crew": []}}
        raise AssertionError(path)

    monkeypatch.setattr(main, "tmdb_request", fake_tmdb)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "metadata", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        first = client.get("/api/v1/meta/title?name=示例电影&year=2025", headers=headers)
        assert first.status_code == 200
        assert first.json()["people"][0]["profile_url"].endswith("/person.jpg")
        assert first.json()["backdrop_url"].endswith("/backdrop.jpg")
        assert first.json()["recommendations"][0]["title"] == "相关推荐"
        assert first.json()["recommendations"][0]["poster_url"].endswith("/related.jpg")
        second = client.get("/api/v1/meta/title?name=示例电影&year=2025", headers=headers)
        assert second.json()["cached"] is True
        assert calls.count("/3/search/multi") == 1
        person = client.get("/api/v1/meta/person/20", headers=headers)
        assert person.status_code == 200
        assert person.json()["works"][0]["title"] == "示例电影"


def test_tmdb_tv_metadata_includes_episode_details(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "episodes.db"
    main.DATA_DIR = tmp_path
    main.startup()

    def fake_tmdb(path, params=None):
        if path == "/3/search/multi":
            return {"results": [{"id": 50, "media_type": "tv", "name": "Test Show",
                                  "first_air_date": "2026-01-01", "popularity": 10}]}
        if path == "/3/tv/50":
            return {"id": 50, "name": "Test Show", "credits": {"cast": [], "crew": []},
                    "recommendations": {"results": []}, "similar": {"results": []}}
        if path == "/3/tv/50/season/2":
            return {"episodes": [{"episode_number": 1, "name": "A New Start",
                                   "overview": "Full episode overview", "air_date": "2026-02-01",
                                   "still_path": "/episode.jpg"}]}
        raise AssertionError(path)

    monkeypatch.setattr(main, "tmdb_request", fake_tmdb)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "episodes", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        response = client.get("/api/v1/meta/title?name=Test%20Show&year=2026&season=2", headers=headers)
        assert response.status_code == 200
        episode = response.json()["episodes"][0]
        assert episode["number"] == 1
        assert episode["title"] == "A New Start"
        assert episode["overview"] == "Full episode overview"
        assert episode["still_url"].endswith("/episode.jpg")


def test_tmdb_metadata_ranks_shared_genres_and_falls_back_to_english_overview(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "relevance.db"
    main.DATA_DIR = tmp_path
    main.startup()

    def fake_tmdb(path, params=None):
        if path == "/3/search/multi":
            return {"results": [{"id": 70, "media_type": "movie", "title": "Exact Movie",
                                  "release_date": "2026-01-01", "popularity": 5}]}
        if path == "/3/movie/70" and params and params.get("language") == "en-US":
            return {"overview": "English fallback plot"}
        if path == "/3/movie/70":
            return {"id": 70, "title": "Exact Movie", "overview": "",
                    "genres": [{"id": 18}], "original_language": "ko",
                    "credits": {"cast": [], "crew": []},
                    "recommendations": {"results": [
                        {"id": 71, "title": "Popular but unrelated", "genre_ids": [35],
                         "original_language": "en", "popularity": 100},
                        {"id": 72, "title": "Related drama", "genre_ids": [18],
                         "original_language": "ko", "popularity": 4}
                    ]}, "similar": {"results": []}}
        raise AssertionError((path, params))

    monkeypatch.setattr(main, "tmdb_request", fake_tmdb)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "relevance", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        response = client.get("/api/v1/meta/title?name=Exact%20Movie&year=2026", headers=headers)
        assert response.status_code == 200
        assert response.json()["overview"] == "English fallback plot"
        assert response.json()["recommendations"][0]["title"] == "Related drama"


def test_tmdb_title_matching_normalizes_punctuation_before_popularity():
    match = main.pick_title_result([
        {"id": 1, "title": "Different Movie", "release_date": "2026-01-01", "popularity": 100},
        {"id": 2, "title": "The-Movie!", "release_date": "2025-01-01", "popularity": 1},
    ], "The Movie", 2025)
    assert match["id"] == 2


def test_tmdb_recommendations_prefer_same_country_and_language(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "recommendation_region.db"
    main.startup()

    def fake_tmdb(path, params=None):
        if path == "/3/search/multi":
            return {"results": [{"id": 90, "media_type": "tv", "name": "Japanese Drama",
                                  "first_air_date": "2026-01-01", "popularity": 5}]}
        if path == "/3/tv/90":
            return {"id": 90, "name": "Japanese Drama", "genres": [{"id": 18}],
                    "original_language": "ja", "origin_country": ["JP"],
                    "credits": {"cast": [], "crew": []},
                    "recommendations": {"results": [
                        {"id": 91, "name": "US Drama", "genre_ids": [18],
                         "original_language": "en", "origin_country": ["US"], "popularity": 20},
                        {"id": 92, "name": "JP Drama", "genre_ids": [18],
                         "original_language": "ja", "origin_country": ["JP"], "popularity": 2}
                    ]}, "similar": {"results": []}}
        if path == "/3/tv/90/season/1":
            return {"episodes": []}
        raise AssertionError((path, params))

    monkeypatch.setattr(main, "tmdb_request", fake_tmdb)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register",
                           json={"username": "region_rank", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        response = client.get("/api/v1/meta/title?name=Japanese%20Drama&year=2026", headers=headers)
        assert response.status_code == 200
        assert response.json()["recommendations"][0]["title"] == "JP Drama"


def test_tmdb_person_name_search_returns_person_ids(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "person-search.db"
    main.DATA_DIR = tmp_path
    main.startup()

    def fake_tmdb(path, params=None):
        assert path == "/3/search/person"
        assert params["query"] == "Example Actor"
        return {"results": [{"id": 88, "name": "Example Actor",
                              "known_for_department": "Acting",
                              "profile_path": "/actor.jpg"}]}

    monkeypatch.setattr(main, "tmdb_request", fake_tmdb)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "personsearch", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        response = client.get("/api/v1/meta/person/search?name=Example%20Actor", headers=headers)
        assert response.status_code == 200
        assert response.json()["people"][0]["id"] == 88
        assert response.json()["people"][0]["profile_url"].endswith("/actor.jpg")


def test_tmdb_title_exposes_organizations_and_exact_organization_works(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "organization.db"
    main.DATA_DIR = tmp_path
    main.startup()

    def fake_tmdb(path, params=None):
        if path == "/3/search/multi":
            return {"results": [{"id": 501, "media_type": "tv", "name": "Studio Show",
                                  "first_air_date": "2026-01-01", "popularity": 8}]}
        if path == "/3/tv/501":
            return {"id": 501, "name": "Studio Show", "overview": "Plot",
                    "production_companies": [{"id": 700, "name": "Blue Studio",
                                                "logo_path": "/studio.png", "origin_country": "JP"}],
                    "networks": [{"id": 701, "name": "Blue Network",
                                  "logo_path": "/network.png", "origin_country": "JP"}],
                    "credits": {"cast": [], "crew": []},
                    "recommendations": {"results": []}, "similar": {"results": []}}
        if path == "/3/tv/501/season/1":
            return {"episodes": []}
        if path == "/3/company/700":
            return {"id": 700, "name": "Blue Studio", "description": "Studio biography",
                    "headquarters": "Tokyo", "origin_country": "JP", "logo_path": "/studio.png"}
        if path == "/3/discover/movie":
            return {"results": [{"id": 801, "title": "Studio Movie", "release_date": "2025-01-01",
                                  "poster_path": "/movie.png", "popularity": 4}]}
        if path == "/3/discover/tv":
            return {"results": [{"id": 802, "name": "Studio Series", "first_air_date": "2024-01-01",
                                  "poster_path": "/series.png", "popularity": 6}]}
        raise AssertionError((path, params))

    monkeypatch.setattr(main, "tmdb_request", fake_tmdb)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register",
                           json={"username": "organization", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        title = client.get("/api/v1/meta/title?name=Studio%20Show&year=2026", headers=headers)
        assert title.status_code == 200
        assert [item["kind"] for item in title.json()["organizations"]] == ["company", "network"]
        assert title.json()["organizations"][0]["logo_url"].endswith("/studio.png")

        company = client.get("/api/v1/meta/organization/company/700", headers=headers)
        assert company.status_code == 200
        assert company.json()["name"] == "Blue Studio"
        assert {work["title"] for work in company.json()["works"]} == {"Studio Movie", "Studio Series"}


def test_tmdb_organization_name_search_returns_exact_company_ids(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "organization-search.db"
    main.DATA_DIR = tmp_path
    main.startup()

    def fake_tmdb(path, params=None):
        assert path == "/3/search/company"
        assert params["query"] == "Example Studio"
        return {"results": [{"id": 990, "name": "Example Studio",
                              "origin_country": "JP", "logo_path": "/company.jpg"}]}

    monkeypatch.setattr(main, "tmdb_request", fake_tmdb)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register",
                           json={"username": "organization_search", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        response = client.get("/api/v1/meta/organization/search?name=Example%20Studio", headers=headers)
        assert response.status_code == 200
        assert response.json()["organizations"][0]["id"] == 990
        assert response.json()["organizations"][0]["logo_url"].endswith("/company.jpg")


def test_dandan_match_cache_receive_and_send(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "dandan.db"
    main.DATA_DIR = tmp_path
    main.DANDAN_APP_ID = "app-id"
    main.DANDAN_APP_SECRET = "app-secret"
    main.startup()
    calls = []

    def fake_request(method, url, **kwargs):
        calls.append((method, url, kwargs.get("payload")))
        if "/search/episodes" in url:
            return 200, {"animes": [{"animeTitle": "示例动画", "episodes": [
                {"episodeId": 123450001, "episodeTitle": "第1集"}]}]}
        if method == "GET" and "/comment/123450001" in url:
            return 200, {"comments": [{"cid": 1, "p": "12.34,1,16777215,42", "m": "测试弹幕"}]}
        if method == "POST" and url.endswith("/comment/123450001/app"):
            assert kwargs["payload"] == {
                "time": 5.0,
                "mode": 4,
                "color": 0x123456,
                "comment": "新弹幕",
                "userName": "danmaku",
            }
            return 200, {"success": True, "cid": 2}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "danmaku", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        params = {"title": "示例动画", "episode_name": "第1集", "year": 2025}
        first = client.get("/api/v1/danmaku/comments", headers=headers, params=params)
        assert first.status_code == 200
        assert first.json()["episode_id"] == 123450001
        assert "测试弹幕" in first.json()["xml"]
        assert "12.34,1,25,16777215" in first.json()["xml"]
        ass = client.get("/api/v1/danmaku/comments.ass", headers=headers, params=params)
        assert ass.status_code == 200
        assert "[Events]" in ass.text and "测试弹幕" in ass.text
        second = client.get("/api/v1/danmaku/comments", headers=headers, params=params)
        assert second.status_code == 200
        assert sum("/search/episodes" in url for _, url, _ in calls) == 1
        assert sum("/comment/123450001?" in url for _, url, _ in calls) == 1
        sent = client.post("/api/v1/danmaku/comments", headers=headers, json={
            "title": "示例动画", "episode_name": "第1集", "year": 2025,
            "position_ms": 5000, "text": "新弹幕", "mode": 4, "color": 0x123456,
        })
        assert sent.status_code == 201
        assert sent.json() == {
            "sent": True,
            "stored_local": True,
            "sent_upstream": True,
            "episode_id": 123450001,
            "upstream_error": "",
        }
        with main.db() as conn:
            cached = conn.execute(
                "SELECT payload FROM metadata_cache WHERE cache_key=?",
                ("dandan:comments:123450001",),
            ).fetchone()
            local_rows = conn.execute("SELECT text,sent_upstream FROM local_danmaku").fetchall()
        assert cached is None
        assert len(local_rows) == 1 and local_rows[0]["text"] == "新弹幕"
        # 自己发送的弹幕在重新拉取时立即可见（本地弹幕库合并）
        third = client.get("/api/v1/danmaku/comments", headers=headers, params=params)
        assert third.status_code == 200
        assert "新弹幕" in third.json()["xml"]
        assert third.json()["local_count"] == 1


def test_dandan_fallback_match_and_local_only_danmaku(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "dandan2.db"
    main.DATA_DIR = tmp_path
    main.DANDAN_APP_ID = "app-id"
    main.DANDAN_APP_SECRET = "app-secret"
    main.startup()

    def fake_request(method, url, **kwargs):
        if "/search/episodes" in url:
            # 带 episode 过滤的搜索返回空，只有标题搜索能命中：验证第二轮回退。
            if "episode=" in url:
                return 200, {"animes": []}
            if "%E7%A4%BA%E4%BE%8B" in url or "示例" in url:
                return 200, {"animes": [{"animeTitle": "示例动画", "episodes": [
                    {"episodeId": 900001, "episodeTitle": "序章"},
                    {"episodeId": 900002, "episodeTitle": "第2集"}]}]}
            return 200, {"animes": []}
        if method == "GET" and "/comment/900002" in url:
            return 200, {"comments": []}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "fallback", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        # 标题带修饰词 + 集数过滤搜不到 → 清洗标题后按集数序号命中第2集
        params = {"title": "示例动画【高清】", "episode_name": "第2集", "year": 2025}
        matched = client.get("/api/v1/danmaku/comments", headers=headers, params=params)
        assert matched.status_code == 200
        assert matched.json()["episode_id"] == 900002
        # 完全无法匹配的影片：发送弹幕仍应落入本地弹幕库并可读回
        miss = {"title": "不存在的影片", "episode_name": "第1集", "year": 2025}
        sent = client.post("/api/v1/danmaku/comments", headers=headers,
                           json=miss | {"position_ms": 3000, "text": "本地弹幕", "mode": 1, "color": 16777215})
        assert sent.status_code == 201
        assert sent.json()["sent_upstream"] is False
        local = client.get("/api/v1/danmaku/comments", headers=headers, params=miss)
        assert local.status_code == 200
        assert "本地弹幕" in local.json()["xml"]
        assert local.json()["episode_id"] == 0


def test_trakt_device_login_and_scrobble(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "trakt.db"
    main.DATA_DIR = tmp_path
    main.TRAKT_CLIENT_ID = "client-id"
    main.TRAKT_CLIENT_SECRET = "client-secret"
    main.startup()
    calls = []

    def fake_request(method, url, **kwargs):
        calls.append((method, url, kwargs.get("payload")))
        if url.endswith("/oauth/device/code"):
            return 200, {"device_code": "device-code", "user_code": "ABCD1234",
                         "verification_url": "https://trakt.tv/activate", "expires_in": 600, "interval": 5}
        if url.endswith("/oauth/device/token"):
            return 200, {"access_token": "access", "refresh_token": "refresh", "expires_in": 86400,
                         "created_at": int(main.time.time()), "scope": "public"}
        if url.endswith("/scrobble/start"):
            assert kwargs["payload"]["episode"] == {"season": 1, "number": 2}
            assert kwargs["payload"]["progress"] == 25.0
            return 201, {"action": "start"}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "traktuser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        started = client.post("/api/v1/trakt/device/start", headers=headers)
        assert started.status_code == 200
        assert started.json()["user_code"] == "ABCD1234"
        polled = client.post("/api/v1/trakt/device/poll", headers=headers)
        assert polled.json()["connected"] is True
        status = client.get("/api/v1/trakt/status", headers=headers).json()
        assert status["connected"] is True
        event = client.post("/api/v1/playback/event", headers=headers, json={
            "event": "start", "media_type": "episode", "title": "示例剧", "year": 2025,
            "tmdb_id": 88, "season": 1, "episode": 2,
            "position_ms": 15000, "duration_ms": 60000,
        })
        assert event.status_code == 200
        assert event.json()["progress"] == 25.0
        with sqlite3.connect(main.DB_PATH) as conn:
            encrypted = conn.execute("SELECT access_token FROM trakt_accounts").fetchone()[0]
        assert encrypted != "access"


def test_neodb_oauth_and_shelf_sync_preserves_user_content(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "neodb.db"
    main.DATA_DIR = tmp_path
    main.NEODB_API_BASE = "https://neodb.social"
    main.NEODB_CLIENT_ID = "neodb-client"
    main.NEODB_CLIENT_SECRET = "neodb-secret"
    main.NEODB_REDIRECT_URI = "urn:ietf:wg:oauth:2.0:oob"
    main.NEODB_VISIBILITY = 2
    main.startup()
    calls = []
    shelf = {"shelf_type": "wishlist", "visibility": 1, "comment_text": "保留短评",
             "rating_grade": 8, "tags": ["保留标签"]}

    def fake_form(method, url, payload):
        assert url.endswith("/oauth/token")
        assert payload["code"] == "AUTH-CODE"
        assert payload["redirect_uri"] == "urn:ietf:wg:oauth:2.0:oob"
        return 200, {"access_token": "neodb-access", "token_type": "Bearer", "scope": "read write"}

    def fake_request(method, url, **kwargs):
        calls.append((method, url, kwargs.get("payload")))
        if url.endswith("/api/me"):
            return 200, {"display_name": "NeoDB用户", "url": "https://neodb.social/users/example/"}
        if "/api/catalog/search?" in url:
            return 200, {"data": [{"uuid": "movie-uuid", "title": "示例电影",
                                    "display_title": "示例电影", "year": 2025,
                                    "category": "movie", "url": "https://neodb.social/movie/movie-uuid"}]}
        if url.endswith("/api/me/shelf/item/movie-uuid") and method == "GET":
            return 200, dict(shelf)
        if url.endswith("/api/me/shelf/item/movie-uuid") and method == "POST":
            payload = kwargs["payload"]
            assert payload["comment_text"] == "保留短评"
            assert payload["rating_grade"] == 8
            assert payload["tags"] == ["保留标签"]
            assert payload["visibility"] == 1
            assert payload["post_to_fediverse"] is False
            shelf.update(payload)
            return 200, {"message": "ok"}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "form_request", fake_form)
    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "neodbuser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        started = client.post("/api/v1/neodb/oauth/start", headers=headers)
        assert started.status_code == 200
        assert "urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob" in started.json()["authorization_url"]
        completed = client.post("/api/v1/neodb/oauth/complete", headers=headers, json={"code": "AUTH-CODE"})
        assert completed.status_code == 200
        assert completed.json()["display_name"] == "NeoDB用户"
        status = client.get("/api/v1/neodb/status", headers=headers).json()
        assert status["connected"] is True
        start_event = client.post("/api/v1/playback/event", headers=headers, json={
            "event": "start", "media_type": "movie", "title": "示例电影", "year": 2025,
            "position_ms": 1000, "duration_ms": 100000,
        })
        assert start_event.status_code == 200
        assert start_event.json()["integrations"]["neodb"]["shelf_type"] == "progress"
        stop_event = client.post("/api/v1/playback/event", headers=headers, json={
            "event": "stop", "media_type": "movie", "title": "示例电影", "year": 2025,
            "position_ms": 95000, "duration_ms": 100000,
        })
        assert stop_event.status_code == 200
        assert stop_event.json()["integrations"]["neodb"]["shelf_type"] == "complete"
        assert shelf["shelf_type"] == "complete"
        with sqlite3.connect(main.DB_PATH) as conn:
            encrypted = conn.execute("SELECT access_token FROM neodb_accounts").fetchone()[0]
        assert encrypted != "neodb-access"


def test_emby_checkins_resume_and_encrypted_account(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "emby.db"
    main.DATA_DIR = tmp_path
    main.startup()
    calls = []

    def fake_request(method, url, **kwargs):
        calls.append((method, url, kwargs.get("payload"), kwargs.get("headers")))
        if method == "GET" and "/Users/emby-user/Items/item-42" in url:
            return 200, {"Id": "item-42", "Name": "示例电影", "Type": "Movie",
                         "ProductionYear": 2025, "ProviderIds": {"Tmdb": "42"},
                         "UserData": {"PlaybackPositionTicks": 120000000, "Played": False}}
        if method == "POST" and "/Sessions/Playing" in url:
            assert kwargs["headers"]["X-Emby-Token"] == "emby-secret-token"
            assert kwargs["payload"]["PositionTicks"] == 150000000
            return 204, {}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "embyuser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        with main.db() as conn:
            user_id = conn.execute("SELECT id FROM users WHERE username='embyuser'").fetchone()["id"]
            now = int(main.time.time() * 1000)
            conn.execute("""INSERT INTO emby_accounts
              (user_id,base_url,emby_user_id,access_token,server_id,created_at,updated_at)
              VALUES(?,?,?,?,?,?,?)""", (user_id, "http://emby.local:8096", "emby-user",
              main.seal_secret("emby-secret-token"), "server", now, now))
        event = client.post("/api/v1/playback/event", headers=headers, json={
            "event": "start", "media_type": "movie", "title": "示例电影", "year": 2025,
            "tmdb_id": 42, "emby_item_id": "item-42", "position_ms": 15000, "duration_ms": 60000,
        })
        assert event.status_code == 200
        assert event.json()["integrations"]["emby"]["reported"] is True
        resume = client.post("/api/v1/emby/resume", headers=headers, json={
            "media_type": "movie", "title": "示例电影", "year": 2025,
            "tmdb_id": 42, "emby_item_id": "item-42",
        })
        assert resume.status_code == 200
        assert resume.json()["loop_suppressed"] is True
        with main.db() as conn:
            encrypted = conn.execute("SELECT access_token FROM emby_accounts").fetchone()[0]
        assert encrypted != "emby-secret-token"
        assert all("emby-secret-token" not in str(payload) for _, _, payload, _ in calls)


def test_reviews_are_separate_and_source_labeled(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "reviews.db"
    main.DATA_DIR = tmp_path
    main.TMDB_READ_TOKEN = "tmdb-token"
    main.TRAKT_CLIENT_ID = "trakt-client"
    main.startup()

    def fake_tmdb(path, params=None):
        if path == "/3/search/movie":
            return {"results": [{"id": 42, "title": "示例电影", "release_date": "2025-01-01"}]}
        if path == "/3/movie/42/reviews":
            return {"results": [{"author": "TMDB作者", "content": "TMDB影评",
                                  "created_at": "2025-01-01", "author_details": {"rating": 8}}]}
        if path == "/3/movie/42":
            return {"id": 42, "vote_average": 8.2, "vote_count": 1200}
        raise AssertionError(path)

    def fake_request(method, url, **kwargs):
        if "/search/movie?" in url:
            return 200, [{"movie": {"ids": {"slug": "example-movie"}}}]
        if "/movies/example-movie/comments/newest" in url:
            return 200, [{"comment": "Trakt评论", "review": False, "user_rating": 7,
                          "user": {"username": "trakt-user"}, "likes": 2}]
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "tmdb_request", fake_tmdb)
    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "reviewuser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        response = client.get("/api/v1/reviews?title=示例电影&year=2025&media_type=movie", headers=headers)
        assert response.status_code == 200
        data = response.json()
        assert "不是按播放时间" in data["notice"]
        assert {"TMDB 用户影评", "Trakt 社区评论", "TMDB 评分概览"}.issubset(
            {item["source"] for item in data["items"]})
        assert all(item["kind"] in ("review", "comment", "rating_summary") for item in data["items"])
        assert data["language_summary"]["zh"] == 2


def test_post_neodb_and_trakt_reviews_use_upstream_only(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "post-reviews.db"
    main.DATA_DIR = tmp_path
    main.NEODB_CLIENT_ID = "neodb-client"
    main.NEODB_CLIENT_SECRET = "neodb-secret"
    main.TRAKT_CLIENT_ID = "trakt-client"
    main.TRAKT_CLIENT_SECRET = "trakt-secret"
    main.startup()
    calls = []

    def fake_request(method, url, **kwargs):
        calls.append((method, url, kwargs.get("payload")))
        if "/api/catalog/search?" in url:
            return 200, {"data": [{"uuid": "neo-42", "display_title": "示例电影", "year": 2025}]}
        if "/api/me/shelf/item/neo-42" in url and method == "GET":
            return 200, {"shelf_type": "complete", "visibility": 0, "tags": []}
        if "/api/me/shelf/item/neo-42" in url and method == "POST":
            return 201, {"comment_text": kwargs["payload"]["comment_text"]}
        if "/search/movie?" in url:
            return 200, [{"movie": {"ids": {"slug": "example-movie"}}}]
        if url.endswith("/comments") and method == "POST":
            return 201, {"id": 9, "comment": kwargs["payload"]["comment"]}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "json_request", fake_request)
    monkeypatch.setattr(main, "neodb_access_token", lambda user_id: "neo-token")
    monkeypatch.setattr(main, "trakt_access_token", lambda user_id: "trakt-token")
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "writer", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        base = {"media_type": "movie", "title": "示例电影", "year": 2025, "text": "这是一条中文短评"}
        neodb = client.post("/api/v1/reviews", headers=headers,
                            json={**base, "source": "neodb", "rating": 8, "visibility": 0})
        trakt = client.post("/api/v1/reviews", headers=headers,
                            json={**base, "source": "trakt", "spoiler": False})
        assert neodb.status_code == 201 and neodb.json()["posted"] is True
        assert trakt.status_code == 201 and trakt.json()["posted"] is True
        posted = [payload for method, _, payload in calls if method == "POST"]
        assert any(payload.get("comment_text") == "这是一条中文短评" for payload in posted)
        assert any(payload.get("comment") == "这是一条中文短评" for payload in posted)


def test_emby_catalog_detail_and_signed_play_do_not_expose_token(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "emby-catalog.db"
    main.DATA_DIR = tmp_path
    main.startup()

    def fake_request(method, url, **kwargs):
        assert kwargs["headers"]["X-Emby-Token"] == "private-emby-token"
        if "/Users/emby-user/Items?" in url:
            return 200, {"TotalRecordCount": 1, "Items": [{
                "Id": "movie-1", "Name": "示例电影", "Type": "Movie", "ProductionYear": 2026,
                "RunTimeTicks": 6000000000,
                "UserData": {"PlaybackPositionTicks": 1200000000, "Played": False},
            }]}
        if "/Users/emby-user/Items/movie-1" in url:
            return 200, {"Id": "movie-1", "Name": "示例电影", "Type": "Movie",
                         "ProductionYear": 2026, "ProviderIds": {"Tmdb": "42"}}
        if method == "POST" and "/Items/movie-1/PlaybackInfo?" in url:
            return 200, {"PlaySessionId": "play-session-1", "MediaSources": [{
                "Id": "media-source-1", "Container": "mkv", "SupportsDirectStream": True,
            }]}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "cataloguser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        with main.db() as conn:
            user_id = conn.execute("SELECT id FROM users WHERE username='cataloguser'").fetchone()["id"]
            now = int(main.time.time() * 1000)
            conn.execute("""INSERT INTO emby_accounts
              (user_id,base_url,emby_user_id,access_token,server_id,created_at,updated_at)
              VALUES(?,?,?,?,?,?,?)""", (user_id, "http://emby.local:8096", "emby-user",
              main.seal_secret("private-emby-token"), "server", now, now))
        catalog = client.get("/api/v1/emby/catalog?section=resume", headers=headers)
        assert catalog.status_code == 200
        assert catalog.json()["items"][0]["note"] == "继续 20%"
        assert "private-emby-token" not in catalog.text
        detail = client.get("/api/v1/emby/item/movie-1", headers=headers)
        assert detail.status_code == 200
        assert detail.json()["list"][0]["vod_play_url"] == "正片$movie-1"
        play = client.get("/api/v1/emby/play/movie-1", headers=headers)
        assert play.status_code == 200
        assert "/api/v1/emby/stream/movie-1" in play.json()["url"]
        assert "private-emby-token" not in play.text


def test_emby_api_key_setup_discovers_users_and_encrypts_key(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "emby-setup.db"
    main.DATA_DIR = tmp_path
    main.startup()
    seen = []

    def fake_request(method, url, **kwargs):
        seen.append((method, url, kwargs.get("headers")))
        assert kwargs["headers"]["X-Emby-Token"] == "easy-api-key"
        if "/Users/Query?" in url:
            return 200, {"Items": [
                {"Id": "user-disabled", "Name": "禁用用户", "Policy": {"IsDisabled": True}},
                {"Id": "user-family", "Name": "家庭用户", "ServerId": "server-1",
                 "Policy": {"IsDisabled": False, "IsAdministrator": False}},
            ]}
        if "/Users/user-family/Views?" in url:
            return 200, {"Items": [{"Id": "movies", "Name": "电影"}]}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "json_request", fake_request)
    users, server_id = configure_emby.fetch_emby_users("http://emby.local:6908", "easy-api-key")
    assert [user["Name"] for user in users] == ["家庭用户"]
    assert server_id == "server-1"
    configure_emby.verify_selected_user("http://emby.local:6908", "easy-api-key", users[0]["Id"])
    with main.db() as conn:
        now = int(main.time.time())
        conn.execute("INSERT INTO users(username,password_hash,created_at) VALUES(?,?,?)",
                     ("setupuser", main.password_hash("password12345"), now))
        local_id = conn.execute("SELECT id FROM users WHERE username='setupuser'").fetchone()["id"]
    configure_emby.save_binding(local_id, "http://emby.local:6908", users[0]["Id"],
                                "easy-api-key", server_id)
    with main.db() as conn:
        account = conn.execute("SELECT * FROM emby_accounts WHERE user_id=?", (local_id,)).fetchone()
    assert account["emby_user_id"] == "user-family"
    assert account["access_token"] != "easy-api-key"
    assert main.open_secret(account["access_token"]) == "easy-api-key"
    assert all("easy-api-key" not in url for _, url, _ in seen)


def test_emby_latest_groups_episodes_and_redirect_drops_token(monkeypatch):
    grouped = main.emby_latest_series([
        {"Id": "ep-1", "Type": "Episode", "SeriesId": "show-1", "SeriesName": "示例剧",
         "ParentIndexNumber": 1, "IndexNumber": 3},
        {"Id": "ep-2", "Type": "Episode", "SeriesId": "show-1", "SeriesName": "示例剧",
         "ParentIndexNumber": 1, "IndexNumber": 2},
        {"Id": "movie-1", "Type": "Movie", "Name": "示例电影"},
    ])
    assert [item["Id"] for item in grouped] == ["show-1", "movie-1"]
    assert grouped[0]["CatalogNote"] == "更新至 S01E03"

    calls = []

    class FakeResponse:
        def __init__(self, status, headers=None):
            self.status = status
            self.headers = headers or {}
        def close(self):
            pass
        def release_conn(self):
            pass

    class FakePool:
        def request(self, method, url, headers=None, **kwargs):
            calls.append((url, dict(headers or {})))
            if len(calls) == 1:
                return FakeResponse(302, {"Location": "https://cdn.example/video.mkv"})
            return FakeResponse(206, {"Content-Type": "video/x-matroska"})

    monkeypatch.setattr(main, "STREAM_HTTP", FakePool())
    account = {"base_url": "http://emby.local:6908", "user_id": "user-1", "token": "secret-key"}
    response = main.open_emby_stream(account, "/Videos/item/stream", "bytes=0-", "GET")
    assert response.status == 206
    assert calls[0][1]["X-Emby-Token"] == "secret-key"
    assert "X-Emby-Token" not in calls[1][1]


def test_emby_search_returns_cards(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "emby-search.db"
    main.DATA_DIR = tmp_path
    main.startup()

    def fake_request(method, url, **kwargs):
        assert method == "GET"
        assert "SearchTerm=%E7%A4%BA%E4%BE%8B" in url
        assert "IncludeItemTypes=Movie%2CSeries" in url
        return 200, {"TotalRecordCount": 2, "Items": [
            {"Id": "m1", "Name": "示例电影", "Type": "Movie", "ProductionYear": 2025,
             "Overview": "简介", "UserData": {}},
            {"Id": "s1", "Name": "示例剧集", "Type": "Series", "ProductionYear": 2024,
             "UserData": {}},
        ]}

    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "searchuser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        # 未配置 Emby 时应提示，而不是 500
        missing = client.get("/api/v1/emby/search", params={"keyword": "示例"}, headers=headers)
        assert missing.status_code == 409
        with main.db() as conn:
            user_id = conn.execute("SELECT id FROM users WHERE username='searchuser'").fetchone()["id"]
            now = int(main.time.time() * 1000)
            conn.execute("""INSERT INTO emby_accounts
              (user_id,base_url,emby_user_id,access_token,server_id,created_at,updated_at)
              VALUES(?,?,?,?,?,?,?)""", (user_id, "http://emby.local:8096", "emby-user",
              main.seal_secret("emby-secret-token"), "server", now, now))
        response = client.get("/api/v1/emby/search", params={"keyword": "示例"}, headers=headers)
        assert response.status_code == 200
        payload = response.json()
        assert payload["total"] == 2
        names = [item["name"] for item in payload["items"]]
        assert names == ["示例电影", "示例剧集"]
        assert all(item["pic"].startswith("http") for item in payload["items"])


def test_emby_play_carries_external_subtitle(tmp_path, monkeypatch):
    main.DB_PATH = tmp_path / "emby-subtitle.db"
    main.DATA_DIR = tmp_path
    main.startup()

    def fake_request(method, url, **kwargs):
        if method == "GET" and "/Users/emby-user/Items/item-9" in url:
            return 200, {"Id": "item-9", "Name": "示例电影", "Type": "Movie"}
        if method == "POST" and "/Items/item-9/PlaybackInfo" in url:
            return 200, {"PlaySessionId": "ps-1", "MediaSources": [{
                "Id": "ms-1", "Container": "mkv", "SupportsDirectStream": True,
                "MediaStreams": [
                    {"Type": "Video", "Index": 0},
                    {"Type": "Subtitle", "Index": 2, "IsExternal": True,
                     "Language": "eng", "Codec": "subrip", "DisplayTitle": "English"},
                    {"Type": "Subtitle", "Index": 3, "IsExternal": True,
                     "Language": "chi", "Codec": "ass", "DisplayTitle": "简体中文"},
                ]}]}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "subuser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        with main.db() as conn:
            user_id = conn.execute("SELECT id FROM users WHERE username='subuser'").fetchone()["id"]
            now = int(main.time.time() * 1000)
            conn.execute("""INSERT INTO emby_accounts
              (user_id,base_url,emby_user_id,access_token,server_id,created_at,updated_at)
              VALUES(?,?,?,?,?,?,?)""", (user_id, "http://emby.local:8096", "emby-user",
              main.seal_secret("emby-secret-token"), "server", now, now))
        play = client.get("/api/v1/emby/play/item-9", headers=headers)
        assert play.status_code == 200
        payload = play.json()
        assert "subt" in payload
        assert "/api/v1/emby/subtitle/item-9" in payload["subt"]
        assert "idx=3" in payload["subt"] and "fmt=ass" in payload["subt"]


def test_favorites_push_pull_tombstone(tmp_path):
    main.DB_PATH = tmp_path / "favorites.db"
    main.DATA_DIR = tmp_path
    main.startup()
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "favuser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        now = int(main.time.time() * 1000)
        push = client.post("/api/v1/favorites/push", headers=headers, json={
            "device_id": "tv-a", "records": [
                {"source_key": "sourceA", "video_id": "vod1", "name": "示例电影",
                 "pic": "http://img/1.jpg", "deleted": False, "updated_at": now},
            ]})
        assert push.status_code == 200 and push.json()["accepted"] == 1
        pull = client.get("/api/v1/favorites/pull", headers=headers, params={"after": 0})
        assert pull.status_code == 200
        payload = pull.json()
        assert len(payload["records"]) == 1
        assert payload["records"][0]["name"] == "示例电影"
        cursor = payload["cursor"]
        # 旧时间戳不能覆盖新数据
        stale = client.post("/api/v1/favorites/push", headers=headers, json={
            "device_id": "tv-b", "records": [
                {"source_key": "sourceA", "video_id": "vod1", "name": "旧名字",
                 "deleted": False, "updated_at": now - 5000},
            ]})
        assert stale.json()["accepted"] == 0
        # 另一台设备删除 → 墓碑传播
        removed = client.post("/api/v1/favorites/push", headers=headers, json={
            "device_id": "tv-b", "records": [
                {"source_key": "sourceA", "video_id": "vod1", "deleted": True,
                 "updated_at": now + 1000},
            ]})
        assert removed.json()["accepted"] == 1
        pull2 = client.get("/api/v1/favorites/pull", headers=headers, params={"after": cursor})
        records = pull2.json()["records"]
        assert len(records) == 1 and records[0]["deleted"] is True


def test_search_history_push_pull_tombstone_and_cap(tmp_path):
    main.DB_PATH = tmp_path / "search-history.db"
    main.DATA_DIR = tmp_path
    main.startup()
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "searchuser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        now = int(main.time.time() * 1000)
        push = client.post("/api/v1/search-history/push", headers=headers, json={
            "device_id": "tv-a", "records": [
                {"title": "铁拳", "deleted": False, "updated_at": now},
                {"title": "星际穿越", "deleted": False, "updated_at": now + 1},
            ]})
        assert push.status_code == 200 and push.json()["accepted"] == 2
        pull = client.get("/api/v1/search-history/pull", headers=headers, params={"after": 0})
        payload = pull.json()
        assert sorted(r["title"] for r in payload["records"]) == ["星际穿越", "铁拳"]
        cursor = payload["cursor"]
        # 旧时间戳不能覆盖新数据
        stale = client.post("/api/v1/search-history/push", headers=headers, json={
            "device_id": "tv-b", "records": [{"title": "铁拳", "deleted": True, "updated_at": now - 5000}]})
        assert stale.json()["accepted"] == 0
        # 另一台设备删除 → 墓碑传播
        removed = client.post("/api/v1/search-history/push", headers=headers, json={
            "device_id": "tv-b", "records": [{"title": "铁拳", "deleted": True, "updated_at": now + 1000}]})
        assert removed.json()["accepted"] == 1
        pull2 = client.get("/api/v1/search-history/pull", headers=headers, params={"after": cursor})
        records = pull2.json()["records"]
        assert len(records) == 1 and records[0]["deleted"] is True and records[0]["title"] == "铁拳"
        # 超过容量上限的旧词条被挤掉
        bulk = [{"title": f"词条{i}", "deleted": False, "updated_at": now + 2000 + i}
                for i in range(main.MAX_SEARCH_HISTORY + 5)]
        client.post("/api/v1/search-history/push", headers=headers, json={"device_id": "tv-a", "records": bulk})
        with main.db() as conn:
            count = conn.execute("SELECT COUNT(*) AS n FROM search_history").fetchone()["n"]
        assert count == main.MAX_SEARCH_HISTORY


def test_emby_search_falls_back_when_searchterm_unsupported(tmp_path, monkeypatch):
    """小雅聚合 Emby 对 SearchTerm 返回非 JSON：应退回全库快照 + 本地片名过滤。"""
    main.DB_PATH = tmp_path / "emby-xiaoya.db"
    main.DATA_DIR = tmp_path
    main.startup()

    def fake_request(method, url, **kwargs):
        if "SearchTerm=" in url:
            # 模拟小雅返回 HTML 错误页导致 JSON 解析失败
            raise main.HTTPException(502, "上游服务返回了无法识别的数据")
        if method == "GET" and "/Users/emby-user/Items" in url:
            if "StartIndex=0" in url:
                return 200, {"TotalRecordCount": 3, "Items": [
                    {"Id": "m1", "Name": "铁拳", "Type": "Movie", "ProductionYear": 2015, "UserData": {}},
                    {"Id": "m2", "Name": "铁拳教育", "Type": "Series", "ProductionYear": 2024, "UserData": {}},
                    {"Id": "m3", "Name": "别的片子", "Type": "Movie", "ProductionYear": 2020, "UserData": {}},
                ]}
            return 200, {"TotalRecordCount": 3, "Items": []}
        raise AssertionError((method, url))

    monkeypatch.setattr(main, "json_request", fake_request)
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "xiaoyauser", "password": "password12345"})
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        with main.db() as conn:
            user_id = conn.execute("SELECT id FROM users WHERE username='xiaoyauser'").fetchone()["id"]
            now = int(main.time.time() * 1000)
            conn.execute("""INSERT INTO emby_accounts
              (user_id,base_url,emby_user_id,access_token,server_id,created_at,updated_at)
              VALUES(?,?,?,?,?,?,?)""", (user_id, "http://xiaoya.local:6908", "emby-user",
              main.seal_secret("emby-secret-token"), "server", now, now))
        response = client.get("/api/v1/emby/search", params={"keyword": "铁拳"}, headers=headers)
        assert response.status_code == 200
        payload = response.json()
        names = [item["name"] for item in payload["items"]]
        assert names == ["铁拳", "铁拳教育"]  # 前缀匹配优先，无关条目被过滤
        assert payload["total"] == 2


def test_dandan_custom_base_needs_no_signature(monkeypatch):
    """自建弹弹play兼容服务：无 AppId/Secret 也能请求（不带签名头）。"""
    monkeypatch.setattr(main, "DANDAN_APP_ID", "")
    monkeypatch.setattr(main, "DANDAN_APP_SECRET", "")
    monkeypatch.setattr(main, "DANDAN_API_BASE", "http://misaka.local:7768/api/token123")
    headers = main.dandan_headers("/api/v2/comment/1")
    assert headers == {}
    # 官方地址且未配置密钥时仍然明确报错
    monkeypatch.setattr(main, "DANDAN_API_BASE", main.DANDAN_OFFICIAL_BASE)
    try:
        main.dandan_headers("/api/v2/comment/1")
        raise AssertionError("should have raised")
    except main.HTTPException as exc:
        assert exc.status_code == 503
