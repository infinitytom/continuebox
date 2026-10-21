import concurrent.futures
import json
import sqlite3
import time

import pytest
from fastapi import HTTPException
from fastapi.testclient import TestClient
import app.main as main
from app import security


@pytest.fixture
def env(tmp_path, monkeypatch):
    monkeypatch.setattr(main, "DB_PATH", tmp_path / "security.db")
    monkeypatch.setattr(main, "DATA_DIR", tmp_path)
    monkeypatch.setenv("ADMIN_USERNAMES", "owner")
    monkeypatch.setattr(main, "ALLOW_REGISTER", True)
    monkeypatch.setattr(security, "mail_ready", lambda: True)
    sent = {}
    monkeypatch.setattr(security, "deliver", lambda email, code, purpose: sent.update({(email, purpose): code}))
    main.startup()
    with main.db() as conn:
        for name in ("owner", "other"):
            conn.execute("INSERT INTO users(username,password_hash,created_at) VALUES(?,?,?)",
                         (name, main.password_hash("old-pass"), 1234))
    with TestClient(main.app) as client:
        yield client, sent


def login(client, name="owner", device="tv"):
    r = client.post("/api/v1/auth/login", json={"username": name, "password": "old-pass",
                                              "device_id": device, "device_name": device})
    assert r.status_code == 200, r.text
    return {"Authorization": "Bearer " + r.json()["token"]}


def registration(client, sent, name="newuser"):
    email = name + "@example.com"
    r = client.post("/api/v1/auth/email-code", json={"email": email})
    assert r.status_code == 200, r.text
    return {"username": name, "email": email, "password": "new-password-123",
            "code": sent[(email, "register")], "device_id": "phone"}


def test_migration_preserves_users_history_and_legacy_login(env):
    client, _ = env
    with main.db() as conn:
        uid = conn.execute("SELECT id FROM users WHERE username='owner'").fetchone()[0]
    legacy = {"Authorization": "Bearer " + main.make_token(uid)}
    assert client.get("/api/v1/sync/pull", headers=legacy).status_code == 200
    assert client.post("/api/v1/sync/push", headers=legacy, json={
        "device_id": "old-tv", "records": [{"source_key": "source", "video_id": "movie", "updated_at": 100}]}).status_code == 200
    main.startup()
    data = client.get("/api/v1/sync/pull", headers=login(client)).json()
    assert len(data["records"]) == 1
    with main.db() as conn:
        assert conn.execute("SELECT count(*) FROM users").fetchone()[0] == 2


def test_cannot_register_without_email_verification(env):
    client, _ = env
    r = client.post("/api/v1/auth/register", json={"username": "new", "password": "new-password-123"})
    assert r.status_code == 422
    r = client.post("/api/v1/auth/register", json={"username": "new", "password": "new-password-123",
                   "email": "new@example.com", "code": "123456"})
    assert r.status_code == 400


def test_verified_registration_code_is_hashed_single_use(env):
    client, sent = env
    data = registration(client, sent)
    with main.db() as conn:
        row = conn.execute("SELECT code_hash FROM email_challenges").fetchone()
        assert row[0] != data["code"]
    r = client.post("/api/v1/auth/register", json=data)
    assert r.status_code == 201
    assert r.json()["username"] == "newuser"
    assert client.post("/api/v1/auth/register", json=data).status_code == 400
    assert client.post("/api/v1/auth/login", json={"username": data["email"], "password": data["password"]}).status_code == 200


def test_code_guesses_persist_and_resend_has_cooldown(env):
    client, sent = env
    data = registration(client, sent)
    good = data["code"]
    data["code"] = "000000" if good != "000000" else "000001"
    for _ in range(5):
        assert client.post("/api/v1/auth/register", json=data).status_code == 400
    data["code"] = good
    assert client.post("/api/v1/auth/register", json=data).status_code == 400
    assert client.post("/api/v1/auth/email-code", json={"email": data["email"]}).status_code == 429


def test_daily_registration_quota_survives_restart_and_races(env):
    client, sent = env
    with main.db() as conn:
        conn.execute("INSERT INTO security_settings VALUES('limits',?)", (json.dumps({**security.DEFAULTS, "register_daily": 1}),))
    first, second = registration(client, sent, "first"), registration(client, sent, "second")
    with concurrent.futures.ThreadPoolExecutor(2) as pool:
        results = list(pool.map(lambda data: client.post("/api/v1/auth/register", json=data).status_code, [first, second]))
    assert sorted(results) == [201, 429]
    main.startup()
    third = registration(client, sent, "third")
    assert client.post("/api/v1/auth/register", json=third).status_code == 429


def test_mail_failure_never_activates_code(env, monkeypatch):
    client, sent = env
    def fail(*args):
        raise HTTPException(503, "mail unavailable")
    monkeypatch.setattr(security, "deliver", fail)
    assert client.post("/api/v1/auth/email-code", json={"email": "new@example.com"}).status_code == 503
    with main.db() as conn:
        assert conn.execute("SELECT used FROM email_challenges").fetchone()[0] == 1


def test_login_limits_survive_restart_and_ignore_spoofed_headers(env):
    client, _ = env
    for i in range(10):
        r = client.post("/api/v1/auth/login", json={"username": "owner", "password": "wrong-pass"},
                        headers={"X-Forwarded-For": f"203.0.113.{i}"})
        assert r.status_code == 401
    main.startup()
    assert client.post("/api/v1/auth/login", json={"username": "owner", "password": "old-pass"}).status_code == 429


def test_device_revocation_is_scoped_and_keeps_account(env):
    client, _ = env
    tv, phone, other = login(client, device="tv"), login(client, device="phone"), login(client, "other")
    devices = client.get("/api/v1/account/devices", headers=tv).json()["devices"]
    sid = next(d["id"] for d in devices if d["name"] == "phone")
    assert client.delete("/api/v1/account/devices/" + sid, headers=other).status_code == 404
    assert client.delete("/api/v1/account/devices/" + sid, headers=tv).status_code == 200
    assert client.get("/api/v1/account/profile", headers=phone).status_code == 401
    assert client.get("/api/v1/account/profile", headers=tv).status_code == 200
    assert client.get("/api/v1/account/profile", headers=other).status_code == 200
    main.startup()
    assert client.get("/api/v1/account/profile", headers=phone).status_code == 401


def test_logout_all_also_revokes_legacy(env):
    client, _ = env
    headers = login(client)
    with main.db() as conn:
        uid = conn.execute("SELECT id FROM users WHERE username='owner'").fetchone()[0]
    legacy = {"Authorization": "Bearer " + main.make_token(uid)}
    assert client.post("/api/v1/account/logout-all", headers=headers).status_code == 200
    assert client.get("/api/v1/account/profile", headers=headers).status_code == 401
    assert client.get("/api/v1/account/profile", headers=legacy).status_code == 401
    assert client.get("/api/v1/account/profile", headers=login(client, device="fresh")).status_code == 200


def test_admin_data_private_and_reserved_name_cannot_be_claimed(env):
    client, sent = env
    assert client.get("/api/v1/stats").status_code == 401
    assert client.get("/api/v1/admin/users", headers=login(client, "other")).status_code == 403
    assert client.get("/api/v1/admin/users", headers=login(client)).status_code == 200
    data = registration(client, sent, "owner")
    assert client.post("/api/v1/auth/register", json=data).status_code == 409


def test_account_delete_requires_password_code_and_cascades_only_self(env):
    client, sent = env
    data = registration(client, sent)
    r = client.post("/api/v1/auth/register", json=data)
    headers = {"Authorization": "Bearer " + r.json()["token"]}
    assert client.post("/api/v1/auth/email-code", headers=headers, json={"email": data["email"], "purpose": "delete"}).status_code == 200
    body = {"password": data["password"], "code": sent[(data["email"], "delete")], "confirmation": data["username"]}
    assert client.request("DELETE", "/api/v1/account", headers=headers, json={**body, "password": "wrong-password"}).status_code == 400
    assert client.request("DELETE", "/api/v1/account", headers=headers, json=body).status_code == 200
    assert client.get("/api/v1/account/profile", headers=headers).status_code == 401
    with main.db() as conn:
        assert conn.execute("SELECT count(*) FROM users").fetchone()[0] == 2
        assert conn.execute("SELECT count(*) FROM device_sessions").fetchone()[0] == 0


def test_danmaku_xml_filters_bad_data_and_deduplicates(env):
    xml = main.comments_xml({"comments": [
        {"p": "1,1,16777215,remote", "m": "测试<&>"},
        {"p": "1.00,1,16777215,local", "m": "测试<&>"},
        {"p": "nan,1,16777215,x", "m": "bad"},
        {"p": "-1,1,16777215,x", "m": "bad"},
        {"p": "1,9,16777215,x", "m": "bad"},
        {"p": "2,1,16777215,x", "m": "\x00hello"},
        None]})
    assert xml.count("<d ") == 2
    assert "测试&lt;&amp;&gt;" in xml and "\x00" not in xml


def test_manual_danmaku_links_are_per_account(env, monkeypatch):
    client, _ = env
    owner, other = login(client), login(client, "other")
    body = {"title": "节目", "episode": 1, "dandan_episode_id": 12345, "dandan_title": "手动选择"}
    assert client.put("/api/v1/danmaku/link", headers=owner, json=body).status_code == 200
    monkeypatch.setattr(main, "resolve_dandan_episode", lambda *a: {"identity_key": "auto", "dandan_episode_id": 99,
                                                                  "dandan_title": "自动", "match_confidence": 80})
    monkeypatch.setattr(main, "dandan_comments", lambda *a: ({"comments": []}, False))
    assert client.get("/api/v1/danmaku/comments?title=节目&episode=1", headers=owner).json()["episode_id"] == 12345
    assert client.get("/api/v1/danmaku/comments?title=节目&episode=1", headers=other).json()["episode_id"] == 99


def test_chunked_request_size_is_bounded(env):
    client, _ = env
    def chunks():
        for _ in range(5):
            yield b"x" * (1024 * 1024)
    assert client.post("/api/v1/auth/login", content=chunks()).status_code == 413


def test_global_request_limit_and_retry_header(env):
    client, _ = env
    with main.db() as conn:
        conn.execute("INSERT INTO security_settings VALUES('limits',?)",
                     (json.dumps({**security.DEFAULTS, "requests_global_minute": 1}),))
    assert client.get("/health").status_code == 200
    r = client.get("/health", headers={"X-Forwarded-For": "198.51.100.1"})
    assert r.status_code == 429 and r.headers["Retry-After"] == "60"


def test_admin_can_revoke_one_device_without_revoking_others(env):
    client, _ = env
    admin = login(client)
    tv, phone = login(client, "other", "tv"), login(client, "other", "phone")
    with main.db() as conn:
        target = conn.execute("SELECT id FROM users WHERE username='other'").fetchone()[0]
    devices = client.get(f"/api/v1/admin/users/{target}/devices", headers=admin).json()["devices"]
    sid = next(d["id"] for d in devices if d["name"] == "tv")
    assert client.delete(f"/api/v1/admin/users/{target}/devices/{sid}", headers=phone).status_code == 403
    assert client.delete(f"/api/v1/admin/users/{target}/devices/{sid}", headers=admin).status_code == 200
    assert client.get("/api/v1/account/profile", headers=tv).status_code == 401
    assert client.get("/api/v1/account/profile", headers=phone).status_code == 200


def test_local_danmaku_moderation_requires_admin(env):
    client, _ = env
    admin, user = login(client), login(client, "other")
    with main.db() as conn:
        uid = conn.execute("SELECT id FROM users WHERE username='other'").fetchone()[0]
        cur = conn.execute("""INSERT INTO local_danmaku(user_id,identity_key,dandan_episode_id,time_ms,mode,color,text,sent_upstream,created_at)
            VALUES(?, 'test', 0, 1000, 1, 16777215, 'test comment', 0, ?)""", (uid, int(time.time())))
        cid = cur.lastrowid
    assert client.get("/api/v1/admin/danmaku", headers=user).status_code == 403
    assert client.get("/api/v1/admin/danmaku", headers=admin).json()["comments"][0]["id"] == cid
    assert client.delete(f"/api/v1/admin/danmaku/{cid}", headers=user).status_code == 403
    assert client.delete(f"/api/v1/admin/danmaku/{cid}", headers=admin).json()["scope"] == "local_only"


def test_expired_code_cannot_register_and_mail_disabled_fails_closed(env, monkeypatch):
    client, sent = env
    data = registration(client, sent)
    with main.db() as conn:
        conn.execute("UPDATE email_challenges SET expires_at=0")
    assert client.post("/api/v1/auth/register", json=data).status_code == 400
    monkeypatch.setattr(security, "mail_ready", lambda: False)
    assert client.post("/api/v1/auth/email-code", json={"email": "new@example.com"}).status_code == 503
    assert client.post("/api/v1/auth/register", json={"username": "new", "password": "password-12345"}).status_code == 422
