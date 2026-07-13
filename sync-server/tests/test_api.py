import importlib
import os

os.environ["TOKEN_SECRET"] = "test-secret-that-is-at-least-32-characters"

from fastapi.testclient import TestClient
import app.main as main


def test_register_push_pull(tmp_path):
    main.DB_PATH = tmp_path / "test.db"
    main.startup()
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "tester", "password": "password123"})
        assert auth.status_code == 201
        headers = {"Authorization": "Bearer " + auth.json()["token"]}
        pushed = client.post("/api/v1/sync/push", headers=headers, json={
            "device_id": "living-room",
            "records": [{"source_key": "same-source", "video_id": "v1", "episode_id": "e1",
                         "video_name": "测试", "position_ms": 12000, "duration_ms": 60000,
                         "updated_at": 1700000000000}]
        })
        assert pushed.status_code == 200
        assert pushed.json()["accepted"] == 1
        pulled = client.get("/api/v1/sync/pull?since=0", headers=headers)
        assert pulled.status_code == 200
        assert pulled.json()["records"][0]["position_ms"] == 12000


def test_sequence_cursor_returns_writes_with_same_server_time(tmp_path):
    main.DB_PATH = tmp_path / "sequence.db"
    main.startup()
    with TestClient(main.app) as client:
        auth = client.post("/api/v1/auth/register", json={"username": "sequence", "password": "password123"})
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
