import base64
import hashlib
import hmac
import json
import os
import secrets
import sqlite3
import time
import logging
from contextlib import contextmanager
from pathlib import Path
from typing import Annotated

from fastapi import Depends, FastAPI, Header, HTTPException, Query
from pydantic import BaseModel, Field, field_validator

DATA_DIR = Path(os.getenv("DATA_DIR", "./data"))
DB_PATH = DATA_DIR / "tvbox-sync.db"
TOKEN_SECRET = os.getenv("TOKEN_SECRET", "")
TOKEN_DAYS = int(os.getenv("TOKEN_DAYS", "30"))
ALLOW_REGISTER = os.getenv("ALLOW_REGISTER", "true").lower() == "true"
MAX_RECORDS = max(1, int(os.getenv("MAX_RECORDS", "30")))

app = FastAPI(title="TVBox Sync", version="0.1.0")
logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s tvbox-sync %(message)s")
logger = logging.getLogger("tvbox-sync")


@contextmanager
def db():
    conn = sqlite3.connect(DB_PATH, timeout=15)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys=ON")
    conn.execute("PRAGMA journal_mode=WAL")
    try:
        yield conn
        conn.commit()
    finally:
        conn.close()


@app.on_event("startup")
def startup():
    DATA_DIR.mkdir(parents=True, exist_ok=True)
    if len(TOKEN_SECRET) < 32:
        raise RuntimeError("TOKEN_SECRET 必须至少 32 个字符")
    with db() as conn:
        conn.executescript("""
        CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT NOT NULL UNIQUE COLLATE NOCASE,
          password_hash TEXT NOT NULL,
          created_at INTEGER NOT NULL
        );
        CREATE TABLE IF NOT EXISTS records (
          user_id INTEGER NOT NULL,
          record_key TEXT NOT NULL,
          source_key TEXT NOT NULL,
          video_id TEXT NOT NULL,
          video_name TEXT NOT NULL DEFAULT '',
          episode_id TEXT NOT NULL DEFAULT '',
          episode_name TEXT NOT NULL DEFAULT '',
          position_ms INTEGER NOT NULL DEFAULT 0,
          duration_ms INTEGER NOT NULL DEFAULT 0,
          client_updated_at INTEGER NOT NULL,
          server_updated_at INTEGER NOT NULL,
          deleted INTEGER NOT NULL DEFAULT 0,
          device_id TEXT NOT NULL,
          data_json TEXT NOT NULL DEFAULT '',
          progress_key TEXT NOT NULL DEFAULT '',
          PRIMARY KEY(user_id, record_key),
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE INDEX IF NOT EXISTS idx_records_changes
          ON records(user_id, server_updated_at);
        CREATE TABLE IF NOT EXISTS sync_changes (
          sequence INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER NOT NULL,
          record_key TEXT NOT NULL,
          server_updated_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE INDEX IF NOT EXISTS idx_sync_changes_cursor
          ON sync_changes(user_id, sequence);
        """)
        columns = {r["name"] for r in conn.execute("PRAGMA table_info(records)")}
        if "data_json" not in columns:
            conn.execute("ALTER TABLE records ADD COLUMN data_json TEXT NOT NULL DEFAULT ''")
        if "progress_key" not in columns:
            conn.execute("ALTER TABLE records ADD COLUMN progress_key TEXT NOT NULL DEFAULT ''")
        # Existing installations predate the change journal. Seed each stored record once
        # so a newly upgraded client receives a complete initial snapshot.
        conn.execute("""INSERT INTO sync_changes(user_id, record_key, server_updated_at)
                        SELECT r.user_id, r.record_key, r.server_updated_at FROM records r
                        WHERE NOT EXISTS (SELECT 1 FROM sync_changes c
                                          WHERE c.user_id=r.user_id AND c.record_key=r.record_key)""")


def b64(data: bytes) -> str:
    return base64.urlsafe_b64encode(data).rstrip(b"=").decode()


def unb64(data: str) -> bytes:
    return base64.urlsafe_b64decode(data + "=" * (-len(data) % 4))


def password_hash(password: str, salt: bytes | None = None) -> str:
    salt = salt or secrets.token_bytes(16)
    digest = hashlib.scrypt(password.encode(), salt=salt, n=2**14, r=8, p=1)
    return f"{b64(salt)}.{b64(digest)}"


def password_ok(password: str, saved: str) -> bool:
    salt, expected = saved.split(".", 1)
    return hmac.compare_digest(password_hash(password, unb64(salt)), saved)


def make_token(user_id: int) -> str:
    payload = b64(json.dumps({"uid": user_id, "exp": int(time.time()) + TOKEN_DAYS * 86400}, separators=(",", ":")).encode())
    signature = b64(hmac.new(TOKEN_SECRET.encode(), payload.encode(), hashlib.sha256).digest())
    return payload + "." + signature


def current_user(authorization: Annotated[str | None, Header()] = None) -> int:
    if not authorization or not authorization.startswith("Bearer "):
        raise HTTPException(401, "请先登录")
    try:
        payload, signature = authorization[7:].split(".", 1)
        expected = b64(hmac.new(TOKEN_SECRET.encode(), payload.encode(), hashlib.sha256).digest())
        if not hmac.compare_digest(signature, expected):
            raise ValueError
        claims = json.loads(unb64(payload))
        if claims["exp"] < time.time():
            raise ValueError
        return int(claims["uid"])
    except Exception:
        raise HTTPException(401, "登录已失效")


class Credentials(BaseModel):
    username: str = Field(min_length=3, max_length=32, pattern=r"^[A-Za-z0-9_.-]+$")
    password: str = Field(min_length=8, max_length=128)


class Record(BaseModel):
    source_key: str = Field(min_length=1, max_length=200)
    video_id: str = Field(min_length=1, max_length=500)
    video_name: str = Field(default="", max_length=300)
    episode_id: str = Field(default="", max_length=500)
    episode_name: str = Field(default="", max_length=300)
    position_ms: int = Field(default=0, ge=0)
    duration_ms: int = Field(default=0, ge=0)
    updated_at: int = Field(gt=0)
    deleted: bool = False
    data_json: str = Field(default="", max_length=1000000)
    progress_key: str = Field(default="", max_length=2000)

    @field_validator("updated_at")
    @classmethod
    def reasonable_time(cls, value: int):
        if value > int(time.time() * 1000) + 86400000:
            raise ValueError("更新时间不能超过服务器时间一天")
        return value

    def key(self):
        raw = "\0".join((self.source_key, self.video_id, self.episode_id)).encode()
        return hashlib.sha256(raw).hexdigest()


class PushBody(BaseModel):
    device_id: str = Field(min_length=1, max_length=100)
    records: list[Record] = Field(max_length=500)


@app.get("/health")
def health():
    return {"ok": True, "server_time": int(time.time() * 1000)}


@app.post("/api/v1/auth/register", status_code=201)
def register(body: Credentials):
    if not ALLOW_REGISTER:
        raise HTTPException(403, "服务器已关闭注册")
    with db() as conn:
        try:
            cur = conn.execute("INSERT INTO users(username,password_hash,created_at) VALUES(?,?,?)",
                               (body.username, password_hash(body.password), int(time.time() * 1000)))
        except sqlite3.IntegrityError:
            raise HTTPException(409, "用户名已存在")
    return {"token": make_token(cur.lastrowid), "token_type": "bearer"}


@app.post("/api/v1/auth/login")
def login(body: Credentials):
    with db() as conn:
        row = conn.execute("SELECT id,password_hash FROM users WHERE username=?", (body.username,)).fetchone()
    if not row or not password_ok(body.password, row["password_hash"]):
        raise HTTPException(401, "用户名或密码错误")
    return {"token": make_token(row["id"]), "token_type": "bearer"}


@app.post("/api/v1/sync/push")
def push(body: PushBody, user_id: int = Depends(current_user)):
    accepted = 0
    now = int(time.time() * 1000)
    with db() as conn:
        for item in body.records:
            key = item.key()
            old = conn.execute("SELECT client_updated_at FROM records WHERE user_id=? AND record_key=?",
                               (user_id, key)).fetchone()
            # Equal timestamps are retries of the same local snapshot. Keeping the first
            # write makes delayed requests unable to overwrite a newer server value.
            if old and old["client_updated_at"] >= item.updated_at:
                continue
            conn.execute("""INSERT INTO records(user_id,record_key,source_key,video_id,video_name,episode_id,
              episode_name,position_ms,duration_ms,client_updated_at,server_updated_at,deleted,device_id,data_json,progress_key)
              VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
              ON CONFLICT(user_id,record_key) DO UPDATE SET
              video_name=excluded.video_name, episode_name=excluded.episode_name,
              position_ms=excluded.position_ms, duration_ms=excluded.duration_ms,
              client_updated_at=excluded.client_updated_at, server_updated_at=excluded.server_updated_at,
              deleted=excluded.deleted, device_id=excluded.device_id, data_json=excluded.data_json,
              progress_key=excluded.progress_key""",
              (user_id, key, item.source_key, item.video_id, item.video_name, item.episode_id,
               item.episode_name, item.position_ms, item.duration_ms, item.updated_at, now,
               int(item.deleted), body.device_id, item.data_json, item.progress_key))
            conn.execute("INSERT INTO sync_changes(user_id,record_key,server_updated_at) VALUES(?,?,?)",
                         (user_id, key, now))
            accepted += 1
        conn.execute("""DELETE FROM records WHERE user_id=? AND record_key NOT IN
          (SELECT record_key FROM records WHERE user_id=? ORDER BY server_updated_at DESC LIMIT ?)""",
          (user_id, user_id, MAX_RECORDS))
    logger.info("push user=%s device=%s received=%s accepted=%s", user_id, body.device_id, len(body.records), accepted)
    return {"accepted": accepted, "cursor": now}


@app.get("/api/v1/sync/pull")
def pull(since: int = Query(default=0, ge=0), limit: int = Query(default=500, ge=1, le=1000),
         user_id: int = Depends(current_user)):
    with db() as conn:
        rows = conn.execute("""SELECT source_key,video_id,video_name,episode_id,episode_name,
          position_ms,duration_ms,client_updated_at,deleted,device_id,server_updated_at,data_json,progress_key
          FROM records WHERE user_id=? AND server_updated_at>? ORDER BY server_updated_at LIMIT ?""",
          (user_id, since, limit)).fetchall()
    records = [dict(r) | {"deleted": bool(r["deleted"]), "updated_at": r["client_updated_at"]} for r in rows]
    for record in records:
        del record["client_updated_at"]
    cursor = max((r["server_updated_at"] for r in rows), default=since)
    logger.info("pull user=%s since=%s returned=%s cursor=%s", user_id, since, len(records), cursor)
    return {"records": records, "cursor": cursor, "has_more": len(rows) == limit}


@app.get("/api/v1/sync/pull-v2")
def pull_v2(after: int = Query(default=0, ge=0), limit: int = Query(default=500, ge=1, le=1000),
            user_id: int = Depends(current_user)):
    """Sequence-cursor pull for upgraded clients.

    SQLite's autoincrement sequence is strictly ordered, unlike millisecond clock
    timestamps. That means two devices writing in the same millisecond cannot make
    another device permanently skip one of the records.
    """
    with db() as conn:
        events = conn.execute("""SELECT c.sequence, r.source_key,r.video_id,r.video_name,r.episode_id,
          r.episode_name,r.position_ms,r.duration_ms,r.client_updated_at,r.deleted,r.device_id,
          r.server_updated_at,r.data_json,r.progress_key
          FROM sync_changes c LEFT JOIN records r
            ON r.user_id=c.user_id AND r.record_key=c.record_key
          WHERE c.user_id=? AND c.sequence>? ORDER BY c.sequence LIMIT ?""",
          (user_id, after, limit)).fetchall()
    records = []
    for event in events:
        # A retention cleanup may have removed the old record after its journal entry.
        # Still advancing the sequence cursor prevents a client from being stuck on it.
        if event["source_key"] is None:
            continue
        record = dict(event)
        del record["sequence"]
        record["deleted"] = bool(record["deleted"])
        record["updated_at"] = record.pop("client_updated_at")
        records.append(record)
    cursor = max((event["sequence"] for event in events), default=after)
    logger.info("pull-v2 user=%s after=%s returned=%s cursor=%s", user_id, after, len(records), cursor)
    return {"records": records, "cursor": cursor, "has_more": len(events) == limit}
