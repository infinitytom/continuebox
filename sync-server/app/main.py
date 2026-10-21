import base64
import hashlib
import hmac
import json
import os
import secrets
import sqlite3
import time
import logging
import threading
import urllib.parse
import urllib3
import re
import html
import math
import xml.etree.ElementTree as ET
from difflib import SequenceMatcher
from datetime import datetime
from concurrent.futures import ThreadPoolExecutor, TimeoutError as FuturesTimeoutError
from contextlib import contextmanager
from pathlib import Path
from typing import Annotated

from fastapi import BackgroundTasks, Depends, FastAPI, Header, HTTPException, Query, Request
from fastapi.responses import HTMLResponse, PlainTextResponse, StreamingResponse, Response
from starlette.middleware.gzip import GZipMiddleware
from pydantic import BaseModel, Field, field_validator


def optional_env(name: str) -> str:
    """Treat the human-readable values from sample env files as unset."""
    value = os.getenv(name, "").strip()
    lowered = value.lower()
    placeholders = ("请填写", "请粘贴", "请替换", "your_", "replace_", "changeme")
    return "" if any(lowered.startswith(item) for item in placeholders) else value


DATA_DIR = Path(os.getenv("DATA_DIR", "./data"))
DB_PATH = DATA_DIR / "tvbox-sync.db"
TOKEN_SECRET = os.getenv("TOKEN_SECRET", "")
TOKEN_DAYS = int(os.getenv("TOKEN_DAYS", "30"))
ALLOW_REGISTER = os.getenv("ALLOW_REGISTER", "true").lower() == "true"
MAX_RECORDS = max(1, int(os.getenv("MAX_RECORDS", "30")))
TMDB_READ_TOKEN = optional_env("TMDB_READ_TOKEN")
TMDB_LANGUAGE = os.getenv("TMDB_LANGUAGE", "zh-CN").strip() or "zh-CN"
TMDB_CACHE_DAYS = max(1, int(os.getenv("TMDB_CACHE_DAYS", "30")))
TMDB_HOST = "api.themoviedb.org"
TMDB_IMAGE_BASE = "https://image.tmdb.org/t/p/"
DANDAN_API_BASE = os.getenv("DANDAN_API_BASE", "https://api.dandanplay.net").strip().rstrip("/")
DANDAN_APP_ID = optional_env("DANDAN_APP_ID")
DANDAN_APP_SECRET = optional_env("DANDAN_APP_SECRET")
DANDAN_CACHE_SECONDS = max(300, int(os.getenv("DANDAN_CACHE_SECONDS", "21600")))
TRAKT_API_BASE = os.getenv("TRAKT_API_BASE", "https://api.trakt.tv").strip().rstrip("/")
TRAKT_CLIENT_ID = optional_env("TRAKT_CLIENT_ID")
TRAKT_CLIENT_SECRET = optional_env("TRAKT_CLIENT_SECRET")
NEODB_API_BASE = os.getenv("NEODB_API_BASE", "https://neodb.social").strip().rstrip("/")
NEODB_CLIENT_ID = optional_env("NEODB_CLIENT_ID")
NEODB_CLIENT_SECRET = optional_env("NEODB_CLIENT_SECRET")
NEODB_REDIRECT_URI = os.getenv("NEODB_REDIRECT_URI", "urn:ietf:wg:oauth:2.0:oob").strip()
NEODB_VISIBILITY = min(2, max(0, int(os.getenv("NEODB_VISIBILITY", "2"))))
# 可选：科学上网代理（http://host:port 或 socks5h://host:port），只用于 TMDB/Trakt/弹弹play 等外部 API，
# 不影响局域网内 Emby 访问。
OUTBOUND_PROXY = os.getenv("OUTBOUND_PROXY", "").strip()
REVIEWS_CACHE_SECONDS = max(60, int(os.getenv("REVIEWS_CACHE_SECONDS", "900")))
APP_VERSION = "0.27.1"
HTTP = urllib3.PoolManager(timeout=urllib3.Timeout(connect=5, read=12), retries=False)
STREAM_HTTP = urllib3.PoolManager(timeout=urllib3.Timeout(connect=5, read=300), retries=False)
if OUTBOUND_PROXY.startswith("socks"):
    try:
        from urllib3.contrib.socks import SOCKSProxyManager
        PROXY_HTTP = SOCKSProxyManager(OUTBOUND_PROXY, timeout=urllib3.Timeout(connect=5, read=15), retries=False)
    except Exception:
        PROXY_HTTP = None
elif OUTBOUND_PROXY:
    PROXY_HTTP = urllib3.ProxyManager(OUTBOUND_PROXY, timeout=urllib3.Timeout(connect=5, read=15), retries=False)
else:
    PROXY_HTTP = None


def _external_hosts():
    hosts = {TMDB_HOST, "image.tmdb.org", "dns.google"}
    bases = [TRAKT_API_BASE, NEODB_API_BASE]
    # 弹弹play是国内服务，默认直连；代理故障时不应拖垮弹幕。
    # 特殊网络环境可用 DANDAN_VIA_PROXY=true 强制它也走 OUTBOUND_PROXY。
    if os.getenv("DANDAN_VIA_PROXY", "false").strip().lower() == "true":
        bases.append(DANDAN_API_BASE)
    for base in bases:
        host = urllib.parse.urlparse(base).hostname
        if host:
            hosts.add(host.lower())
    return hosts


EXTERNAL_HOSTS = _external_hosts()


def pool_for(url: str):
    """Route requests to well-known external APIs through the optional proxy."""
    if PROXY_HTTP is None:
        return HTTP
    host = (urllib.parse.urlparse(url).hostname or "").lower()
    return PROXY_HTTP if host in EXTERNAL_HOSTS else HTTP

app = FastAPI(title="TVBox Sync", version=APP_VERSION)
# Initial/account-switch pulls contain nested media JSON and compress extremely well.
# Small heartbeat responses stay uncompressed, so normal LAN latency is unchanged.
class ApiGZipMiddleware(GZipMiddleware):
    async def __call__(self, scope, receive, send):
        # Range offsets and Content-Length refer to the original video bytes.
        # Compressing a video stream also buffers chunks and wastes CPU.
        if scope.get("path", "").startswith("/api/v1/emby/stream/"):
            return await self.app(scope, receive, send)
        return await super().__call__(scope, receive, send)


app.add_middleware(ApiGZipMiddleware, minimum_size=1024, compresslevel=5)
logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s tvbox-sync %(message)s")
logger = logging.getLogger("tvbox-sync")
APP_STARTED_AT = int(time.time())
REQUEST_METRICS = {"requests": 0, "errors": 0, "total_ms": 0, "last_request_at": 0}
REQUEST_METRICS_LOCK = threading.Lock()
PASSWORD_HASH_SLOTS = threading.BoundedSemaphore(4)


@app.middleware("http")
async def collect_request_metrics(request: Request, call_next):
    started = time.perf_counter()
    status = 500
    try:
        response = await call_next(request)
        status = response.status_code
        return response
    finally:
        elapsed_ms = int((time.perf_counter() - started) * 1000)
        with REQUEST_METRICS_LOCK:
            REQUEST_METRICS["requests"] += 1
            REQUEST_METRICS["total_ms"] += elapsed_ms
            REQUEST_METRICS["last_request_at"] = int(time.time() * 1000)
            if status >= 400:
                REQUEST_METRICS["errors"] += 1


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
          content_key TEXT NOT NULL DEFAULT '',
          content_year INTEGER NOT NULL DEFAULT 0,
          episode_key TEXT NOT NULL DEFAULT '',
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
        CREATE INDEX IF NOT EXISTS idx_sync_changes_record
          ON sync_changes(user_id, record_key, sequence);
        CREATE TABLE IF NOT EXISTS favorites (
          user_id INTEGER NOT NULL,
          fav_key TEXT NOT NULL,
          source_key TEXT NOT NULL DEFAULT '',
          video_id TEXT NOT NULL DEFAULT '',
          name TEXT NOT NULL DEFAULT '',
          pic TEXT NOT NULL DEFAULT '',
          deleted INTEGER NOT NULL DEFAULT 0,
          client_updated_at INTEGER NOT NULL,
          server_updated_at INTEGER NOT NULL,
          device_id TEXT NOT NULL DEFAULT '',
          PRIMARY KEY(user_id, fav_key),
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS favorite_changes (
          sequence INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER NOT NULL,
          fav_key TEXT NOT NULL,
          server_updated_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE INDEX IF NOT EXISTS idx_favorite_changes_cursor
          ON favorite_changes(user_id, sequence);
        CREATE TABLE IF NOT EXISTS search_history (
          user_id INTEGER NOT NULL,
          term_key TEXT NOT NULL,
          title TEXT NOT NULL DEFAULT '',
          deleted INTEGER NOT NULL DEFAULT 0,
          client_updated_at INTEGER NOT NULL,
          server_updated_at INTEGER NOT NULL,
          device_id TEXT NOT NULL DEFAULT '',
          PRIMARY KEY(user_id, term_key),
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS search_history_changes (
          sequence INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER NOT NULL,
          term_key TEXT NOT NULL,
          server_updated_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE INDEX IF NOT EXISTS idx_search_history_changes_cursor
          ON search_history_changes(user_id, sequence);
        CREATE TABLE IF NOT EXISTS metadata_cache (
          cache_key TEXT PRIMARY KEY,
          payload TEXT NOT NULL,
          expires_at INTEGER NOT NULL,
          updated_at INTEGER NOT NULL
        );
        CREATE TABLE IF NOT EXISTS media_identities (
          identity_key TEXT PRIMARY KEY,
          media_type TEXT NOT NULL DEFAULT '',
          title TEXT NOT NULL DEFAULT '',
          content_year INTEGER NOT NULL DEFAULT 0,
          tmdb_id INTEGER NOT NULL DEFAULT 0,
          imdb_id TEXT NOT NULL DEFAULT '',
          season_number INTEGER NOT NULL DEFAULT 0,
          episode_number INTEGER NOT NULL DEFAULT 0,
          dandan_episode_id INTEGER NOT NULL DEFAULT 0,
          dandan_title TEXT NOT NULL DEFAULT '',
          emby_item_id TEXT NOT NULL DEFAULT '',
          match_confidence INTEGER NOT NULL DEFAULT 0,
          manually_confirmed INTEGER NOT NULL DEFAULT 0,
          updated_at INTEGER NOT NULL
        );
        CREATE TABLE IF NOT EXISTS trakt_accounts (
          user_id INTEGER PRIMARY KEY,
          access_token TEXT NOT NULL,
          refresh_token TEXT NOT NULL,
          expires_at INTEGER NOT NULL,
          scope TEXT NOT NULL DEFAULT '',
          created_at INTEGER NOT NULL,
          updated_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS trakt_device_sessions (
          user_id INTEGER PRIMARY KEY,
          device_code TEXT NOT NULL,
          user_code TEXT NOT NULL,
          verification_url TEXT NOT NULL,
          expires_at INTEGER NOT NULL,
          interval_seconds INTEGER NOT NULL,
          next_poll_at INTEGER NOT NULL,
          created_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS trakt_scrobble_state (
          user_id INTEGER NOT NULL,
          media_key TEXT NOT NULL,
          action TEXT NOT NULL,
          progress REAL NOT NULL,
          reported_at INTEGER NOT NULL,
          PRIMARY KEY(user_id, media_key),
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS neodb_accounts (
          user_id INTEGER PRIMARY KEY,
          access_token TEXT NOT NULL,
          display_name TEXT NOT NULL DEFAULT '',
          profile_url TEXT NOT NULL DEFAULT '',
          created_at INTEGER NOT NULL,
          updated_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS neodb_sync_state (
          user_id INTEGER NOT NULL,
          item_uuid TEXT NOT NULL,
          shelf_type TEXT NOT NULL,
          reported_at INTEGER NOT NULL,
          PRIMARY KEY(user_id, item_uuid),
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS account_settings (
          user_id INTEGER PRIMARY KEY,
          encrypted_snapshot TEXT NOT NULL,
          snapshot_hash TEXT NOT NULL,
          revision INTEGER NOT NULL DEFAULT 1,
          device_id TEXT NOT NULL DEFAULT '',
          created_at INTEGER NOT NULL,
          updated_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS emby_accounts (
          user_id INTEGER PRIMARY KEY,
          base_url TEXT NOT NULL,
          emby_user_id TEXT NOT NULL,
          access_token TEXT NOT NULL,
          server_id TEXT NOT NULL DEFAULT '',
          created_at INTEGER NOT NULL,
          updated_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS emby_playback_state (
          user_id INTEGER NOT NULL,
          media_key TEXT NOT NULL,
          emby_item_id TEXT NOT NULL DEFAULT '',
          play_session_id TEXT NOT NULL DEFAULT '',
          position_ms INTEGER NOT NULL DEFAULT 0,
          played INTEGER NOT NULL DEFAULT 0,
          source TEXT NOT NULL DEFAULT '',
          source_updated_at INTEGER NOT NULL DEFAULT 0,
          version INTEGER NOT NULL DEFAULT 1,
          last_event TEXT NOT NULL DEFAULT '',
          last_sent_at INTEGER NOT NULL DEFAULT 0,
          PRIMARY KEY(user_id, media_key),
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE TABLE IF NOT EXISTS local_danmaku (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER NOT NULL,
          identity_key TEXT NOT NULL,
          dandan_episode_id INTEGER NOT NULL DEFAULT 0,
          time_ms INTEGER NOT NULL DEFAULT 0,
          mode INTEGER NOT NULL DEFAULT 1,
          color INTEGER NOT NULL DEFAULT 16777215,
          text TEXT NOT NULL,
          sent_upstream INTEGER NOT NULL DEFAULT 0,
          created_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE INDEX IF NOT EXISTS idx_local_danmaku_identity
          ON local_danmaku(identity_key);
        CREATE INDEX IF NOT EXISTS idx_local_danmaku_episode
          ON local_danmaku(dandan_episode_id);
        """)
        conn.executescript("""
        CREATE TABLE IF NOT EXISTS local_reviews (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER NOT NULL,
          identity_key TEXT NOT NULL,
          media_type TEXT NOT NULL DEFAULT 'movie',
          title TEXT NOT NULL,
          content_year INTEGER NOT NULL DEFAULT 0,
          season_number INTEGER NOT NULL DEFAULT 0,
          episode_number INTEGER NOT NULL DEFAULT 0,
          text TEXT NOT NULL,
          rating INTEGER NOT NULL DEFAULT 0,
          spoiler INTEGER NOT NULL DEFAULT 0,
          created_at INTEGER NOT NULL,
          FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
        );
        CREATE INDEX IF NOT EXISTS idx_local_reviews_media ON local_reviews(identity_key, created_at DESC);
        """)
        columns = {r["name"] for r in conn.execute("PRAGMA table_info(records)")}
        if "data_json" not in columns:
            conn.execute("ALTER TABLE records ADD COLUMN data_json TEXT NOT NULL DEFAULT ''")
        if "progress_key" not in columns:
            conn.execute("ALTER TABLE records ADD COLUMN progress_key TEXT NOT NULL DEFAULT ''")
        if "content_key" not in columns:
            conn.execute("ALTER TABLE records ADD COLUMN content_key TEXT NOT NULL DEFAULT ''")
        if "content_year" not in columns:
            conn.execute("ALTER TABLE records ADD COLUMN content_year INTEGER NOT NULL DEFAULT 0")
        if "episode_key" not in columns:
            conn.execute("ALTER TABLE records ADD COLUMN episode_key TEXT NOT NULL DEFAULT ''")
        conn.execute("CREATE INDEX IF NOT EXISTS idx_records_content ON records(user_id, content_key, content_year)")
        # Existing installations predate the change journal. Seed each stored record once
        # so a newly upgraded client receives a complete initial snapshot.
        conn.execute("""INSERT INTO sync_changes(user_id, record_key, server_updated_at)
                        SELECT r.user_id, r.record_key, r.server_updated_at FROM records r
                        WHERE NOT EXISTS (SELECT 1 FROM sync_changes c
                                          WHERE c.user_id=r.user_id AND c.record_key=r.record_key)""")
        # pull-v2 joins journal entries to the current record snapshot, so older entries for
        # the same record cannot add information. Compact legacy heartbeat rows on upgrade.
        conn.execute("""DELETE FROM sync_changes
                        WHERE sequence NOT IN (
                          SELECT MAX(sequence) FROM sync_changes GROUP BY user_id,record_key
                        )
                        OR NOT EXISTS (
                          SELECT 1 FROM records r
                          WHERE r.user_id=sync_changes.user_id
                            AND r.record_key=sync_changes.record_key
                        )""")
    security.migrate()


def b64(data: bytes) -> str:
    return base64.urlsafe_b64encode(data).rstrip(b"=").decode()


def cached_json(key: str):
    with db() as conn:
        row = conn.execute("SELECT payload,expires_at FROM metadata_cache WHERE cache_key=?", (key,)).fetchone()
    if not row:
        return None, None
    try:
        return json.loads(row["payload"]), row["expires_at"]
    except Exception:
        return None, None


def save_cached_json(key: str, payload: dict):
    now = int(time.time())
    expires = now + TMDB_CACHE_DAYS * 86400
    with db() as conn:
        conn.execute("""INSERT INTO metadata_cache(cache_key,payload,expires_at,updated_at) VALUES(?,?,?,?)
          ON CONFLICT(cache_key) DO UPDATE SET payload=excluded.payload,
          expires_at=excluded.expires_at,updated_at=excluded.updated_at""",
          (key, json.dumps(payload, ensure_ascii=False, separators=(",", ":")), expires, now))


def save_cached_json_for(key: str, payload: dict, ttl_seconds: int):
    now = int(time.time())
    expires = now + max(1, ttl_seconds)
    with db() as conn:
        conn.execute("""INSERT INTO metadata_cache(cache_key,payload,expires_at,updated_at) VALUES(?,?,?,?)
          ON CONFLICT(cache_key) DO UPDATE SET payload=excluded.payload,
          expires_at=excluded.expires_at,updated_at=excluded.updated_at""",
          (key, json.dumps(payload, ensure_ascii=False, separators=(",", ":")), expires, now))


def tmdb_headers():
    return {"Authorization": "Bearer " + TMDB_READ_TOKEN, "Accept": "application/json"}


def doh_addresses(timeout=None):
    response = pool_for("https://dns.google/").request("GET", "https://dns.google/resolve?" + urllib.parse.urlencode({
        "name": TMDB_HOST, "type": "A"
    }), headers={"Accept": "application/dns-json"}, timeout=timeout)
    data = json.loads(response.data.decode("utf-8"))
    return [x["data"] for x in data.get("Answer", []) if x.get("type") == 1]


def tmdb_request(path: str, params: dict | None = None):
    if not TMDB_READ_TOKEN:
        raise HTTPException(503, "服务器尚未配置 TMDB Read Access Token")
    query = urllib.parse.urlencode(params or {}, doseq=True)
    url = "https://" + TMDB_HOST + path + (("?" + query) if query else "")
    last_error = None
    deadline = time.monotonic() + 12

    def remaining_timeout():
        remaining = max(0.1, deadline - time.monotonic())
        return urllib3.Timeout(total=remaining, connect=min(3, remaining), read=min(6, remaining))

    try:
        response = pool_for(url).request("GET", url, headers=tmdb_headers(), timeout=remaining_timeout())
        if response.status < 500:
            if response.status != 200:
                raise HTTPException(response.status, "TMDB 请求失败")
            return json.loads(response.data.decode("utf-8"))
    except HTTPException:
        raise
    except Exception as exc:
        last_error = exc
    # Some mainland DNS resolvers return an unusable address for the TMDB API.
    # Resolve through DNS-over-HTTPS and keep TLS SNI/hostname verification intact.
    try:
        for address in doh_addresses(remaining_timeout())[:2] if time.monotonic() < deadline else []:
            if time.monotonic() >= deadline:
                break
            try:
                with urllib3.HTTPSConnectionPool(address, port=443, assert_hostname=TMDB_HOST,
                                                   server_hostname=TMDB_HOST,
                                                   timeout=remaining_timeout(), retries=False) as pool:
                    target = path + (("?" + query) if query else "")
                    response = pool.request("GET", target, headers=tmdb_headers() | {"Host": TMDB_HOST})
                if response.status == 200:
                    return json.loads(response.data.decode("utf-8"))
                if response.status < 500:
                    raise HTTPException(response.status, "TMDB 请求失败")
            except HTTPException:
                raise
            except Exception as exc:
                last_error = exc
    except HTTPException:
        raise
    except Exception as exc:
        last_error = exc
    logger.warning("tmdb unavailable: %s", last_error)
    raise HTTPException(502, "TMDB 暂时不可用，请稍后重试")


def json_request(method: str, url: str, *, headers: dict | None = None, payload: dict | None = None,
                 redirect: bool = True):
    body = None if payload is None else json.dumps(payload, ensure_ascii=False, separators=(",", ":")).encode("utf-8")
    request_headers = {"Accept": "application/json", **(headers or {})}
    if body is not None:
        request_headers["Content-Type"] = "application/json"
    try:
        # PoolManager(retries=False) does not follow redirects. Comment APIs may
        # redirect to a CDN; follow GET/HEAD explicitly, without leaking API keys.
        current = url
        for hop in range(4):
            response = pool_for(current).request(method, current, headers=request_headers,
                                                  body=body, redirect=False)
            if not (redirect and method.upper() in ("GET", "HEAD")
                    and response.status in (301, 302, 303, 307, 308)):
                break
            location = response.headers.get("Location")
            if not location or hop == 3:
                raise HTTPException(502, "上游服务重定向无效或次数过多")
            target = urllib.parse.urljoin(current, location)
            old, new = urllib.parse.urlparse(current), urllib.parse.urlparse(target)
            if new.scheme not in ("http", "https") or (old.scheme == "https" and new.scheme != "https"):
                raise HTTPException(502, "上游服务返回了不安全的重定向")
            if (old.scheme, old.netloc) != (new.scheme, new.netloc):
                request_headers = {k: v for k, v in request_headers.items()
                                   if k.lower() in ("accept", "user-agent")}
            current = target
        content = response.data.decode("utf-8") if response.data else ""
        data = json.loads(content) if content else {}
        return response.status, data
    except (ValueError, UnicodeDecodeError) as exc:
        raise HTTPException(502, "上游服务返回了无法识别的数据") from exc
    except HTTPException:
        raise
    except Exception as exc:
        logger.warning("external request failed host=%s type=%s",
                       urllib.parse.urlparse(url).hostname, type(exc).__name__)
        raise HTTPException(502, "上游服务暂时不可用") from exc


def form_request(method: str, url: str, payload: dict):
    body = urllib.parse.urlencode(payload).encode("utf-8")
    try:
        response = pool_for(url).request(method, url, headers={
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        }, body=body)
        content = response.data.decode("utf-8") if response.data else ""
        return response.status, json.loads(content) if content else {}
    except (ValueError, UnicodeDecodeError) as exc:
        raise HTTPException(502, "上游服务返回了无法识别的数据") from exc
    except HTTPException:
        raise
    except Exception as exc:
        logger.warning("external form request failed url=%s error=%s", url, exc)
        raise HTTPException(502, "上游服务暂时不可用") from exc


DANDAN_OFFICIAL_BASE = "https://api.dandanplay.net"
# credential（默认）：X-AppId + X-AppSecret 直传，官方推荐服务器端应用使用，
#   不受系统时钟偏差影响；signature：传统签名模式。
DANDAN_AUTH_MODE = os.getenv("DANDAN_AUTH_MODE", "credential").strip().lower()


def dandan_headers(path: str):
    if DANDAN_APP_ID and DANDAN_APP_SECRET:
        if DANDAN_AUTH_MODE == "signature":
            timestamp = str(int(time.time()))
            digest = hashlib.sha256((DANDAN_APP_ID + timestamp + path.lower() + DANDAN_APP_SECRET).encode()).digest()
            return {
                "X-AppId": DANDAN_APP_ID,
                "X-Timestamp": timestamp,
                "X-Signature": base64.b64encode(digest).decode(),
            }
        return {"X-AppId": DANDAN_APP_ID, "X-AppSecret": DANDAN_APP_SECRET}
    if DANDAN_API_BASE != DANDAN_OFFICIAL_BASE:
        # 自建的弹弹play兼容服务（misaka_danmu_server、danmu_api 等）不需要官方签名。
        return {}
    raise HTTPException(503, "服务器尚未配置弹弹play AppId 和 AppSecret；"
                             "或改用自建兼容弹幕服务（设置 DANDAN_API_BASE）")


def episode_number(value: str, fallback: int = 0):
    text = value or ""
    for pattern in (
        r"第\s*(\d{1,5})\s*[集话話期]",
        r"(?:^|[^a-z])e(?:p)?\s*0*(\d{1,5})",
        r"^\s*0*(\d{1,5})(?:\.0+)?\s*$",
        # 弹弹play 的 episodeTitle 常见形如 “12. 标题” / “第12话 标题” / “12 标题”，
        # 之前只认整串纯数字，绝大多数标题解析不出集号，被迫退回按位置取，从而串集。
        r"^\s*0*(\d{1,4})\s*[\.、,，:：]",
        r"^\s*0*(\d{1,4})\s+\S",
    ):
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            return max(1, int(match.group(1)))
    return max(0, fallback)


def media_identity_key(title: str, year: int = 0, tmdb_id: int = 0, media_type: str = "",
                       season: int = 0, episode: int = 0):
    normalized = "".join(c.lower() for c in (title or "").strip() if c.isalnum())
    raw = f"{media_type}|{tmdb_id}|{normalized}|{year}|{season}|{episode}"
    return hashlib.sha256(raw.encode()).hexdigest()


def normalize_title(value: str):
    return "".join(c.lower() for c in (value or "") if c.isalnum())


def clean_media_title(title: str):
    """Strip site decorations that break dandanplay keyword search."""
    text = (title or "").strip()
    text = re.sub(r"[【\[『「].*?[】\]』」]", " ", text)
    text = re.sub(r"[（(].*?[）)]", " ", text)
    text = re.sub(r"(?i)\b(4k|2160p|1080p|720p|hdr|hd|bd|web-?dl)\b", " ", text)
    text = re.sub(r"(蓝光|超清|高清|国语版?|粤语版?|中字|双语|完整版|未删减版?|修复版)", " ", text)
    text = re.sub(r"\s+", " ", text).strip()
    return text or (title or "").strip()


def dandan_title_variants(title: str):
    cleaned = clean_media_title(title)
    variants = [cleaned]
    stripped = re.sub(r"[\s·:：-]*(第[0-9一二三四五六七八九十]+[季部篇]|[Ss]eason\s*\d+)\s*$", "", cleaned).strip()
    if stripped and stripped not in variants:
        variants.append(stripped)
    raw = (title or "").strip()
    if raw and raw not in variants:
        variants.append(raw)
    return [v for v in variants if v]


def dandan_search_animes(keyword: str, number: int = 0, tmdb_id: int = 0):
    path = "/api/v2/search/episodes"
    # v2=true：切换到弹弹play新版搜索引擎（2026-07 上线，分词与结果质量更好）。
    # tmdbId：官方支持用 TMDB ID 反查弹幕库，比纯片名匹配可靠得多。
    params = {"v2": "true"}
    if keyword:
        params["anime"] = keyword
    if tmdb_id > 0:
        params["tmdbId"] = str(tmdb_id)
    if number > 0:
        params["episode"] = str(number)
    if "anime" not in params and "tmdbId" not in params:
        return []
    status, result = json_request("GET", DANDAN_API_BASE + path + "?" + urllib.parse.urlencode(params),
                                  headers=dandan_headers(path))
    if status in (401, 403):
        raise HTTPException(502, f"弹弹play拒绝访问（HTTP {status}）：请确认 AppId/AppSecret 是"
                                 "开放平台审核通过后下发的凭证，并检查飞牛系统时间是否准确")
    if status != 200:
        raise HTTPException(502, f"弹弹play搜索失败（HTTP {status}）")
    if result.get("success") is False:
        raise HTTPException(502, "弹弹play搜索失败：" + str(result.get("errorMessage") or "未知错误"))
    return result.get("animes") or []


def dandan_title_score(anime: dict, variants: list):
    """片名匹配强度。>=200 表示完全一致或互为前缀，可以认定是同一部作品。"""
    anime_title = normalize_title(anime.get("animeTitle"))
    if not anime_title:
        return 0
    best = 0
    for index, variant in enumerate(variants):
        wanted = normalize_title(variant)
        if not wanted:
            continue
        if anime_title == wanted:
            best = max(best, 300 - index)
        elif anime_title.startswith(wanted) or wanted.startswith(anime_title):
            best = max(best, 200 - index)
        elif wanted in anime_title:
            best = max(best, 100 - index)
    return best


STRONG_TITLE_MATCH = 200


def pick_dandan_anime(animes: list, variants: list, require_match: bool = False):
    scored = [anime for anime in animes if anime.get("episodes")]
    if not scored:
        return None
    best = max(scored, key=lambda anime: dandan_title_score(anime, variants))
    # 纯片名搜索时，得分为 0 说明片名和结果毫无重合，取它只会挂上完全无关的弹幕。
    # tmdbId 反查的结果本身已经足够可信，不做这层过滤。
    if require_match and dandan_title_score(best, variants) <= 0:
        return None
    return best


def dandan_episode_number(item: dict, allow_id_tail: bool = True):
    """尽可能可靠地取出一条弹弹play剧集的集号：显式字段 > 标题解析 > episodeId 尾数。

    弹弹play 的 episodeId 约定为 animeId*10000+集序号，可作兜底；但 PV/特别篇也占序号，
    所以它只在标题解析全部失败时才参与匹配（见 pick_dandan_episode 的两轮策略）。"""
    for field in ("episodeNumber", "episodeIndex", "episodeNo"):
        try:
            value = int(item.get(field) or 0)
        except (TypeError, ValueError):
            value = 0
        if value > 0:
            return value
    parsed = episode_number(str(item.get("episodeTitle") or ""), 0)
    if parsed > 0:
        return parsed
    if not allow_id_tail:
        return 0
    try:
        tail = int(item.get("episodeId") or 0) % 10000
    except (TypeError, ValueError):
        tail = 0
    return tail if 0 < tail < 9000 else 0


def pick_dandan_episode(anime: dict, number: int, allow_positional: bool = False):
    episodes = [e for e in anime.get("episodes") or [] if int(e.get("episodeId") or 0)]
    if not episodes:
        return None
    if number <= 0:
        return episodes[0]
    # 第一轮只信显式字段和标题里的集号；第二轮才允许用 episodeId 尾数兜底，
    # 免得 PV/特别篇的尾数抢在真正的“第 N 话”前面命中。
    for allow_id_tail in (False, True):
        for item in episodes:
            if dandan_episode_number(item, allow_id_tail) == number:
                return item
    # 整份列表都解析不出集号：只能按位置取。
    if len(episodes) >= number and all(dandan_episode_number(e) == 0 for e in episodes):
        return episodes[number - 1]
    # 已经确认是同一部作品（tmdbId 命中，或片名完全一致/互为前缀）时，集号对不齐
    # 多半是弹弹play 那边的编排差异（分季合并、混入特别篇）。这种情况下按位置兜底
    # 比彻底没有弹幕更有用；反之片名只是「含有」关系时不兜底，避免挂上无关弹幕。
    if allow_positional and len(episodes) >= number:
        return episodes[number - 1]
    return None


def resolve_tmdb_id_by_title(title: str, year: int, media_type: str):
    """客户端多数影视源拿不到 TMDB ID，这里用片名+年份在服务端反查一次，供弹幕匹配
    和 Trakt（中文片名无 ID 无法匹配）等使用。结果缓存 7 天；失败返回 0，不影响后续按片名匹配。"""
    if not TMDB_READ_TOKEN:
        return 0
    query = clean_media_title(title)
    if not query:
        return 0
    tmdb_type = "movie" if media_type == "movie" else "tv"
    cache_key = "tmdbid:" + hashlib.sha256(f"{tmdb_type}|{query.lower()}|{year}".encode()).hexdigest()
    cached, expires = cached_json(cache_key)
    if cached is not None and expires and expires > int(time.time()):
        return int(cached.get("id") or 0)
    params = {"query": query, "language": TMDB_LANGUAGE}
    if year > 0:
        params["year" if tmdb_type == "movie" else "first_air_date_year"] = year
    try:
        search = tmdb_request("/3/search/" + tmdb_type, params)
    except HTTPException:
        # TMDB 不可达时别每次都重走这条慢路径：直连失败后还会再试 DoH，
        # 累计可能二十几秒，会把弹幕匹配一起拖住。短期缓存一个「查不到」，
        # 让调用方立刻退回按片名搜索；10 分钟后自动再试，网络恢复不需要重启。
        save_cached_json_for(cache_key, {"id": 0}, 600)
        return 0
    candidate = pick_title_result(search.get("results") or [], query, year, tmdb_type)
    resolved = int((candidate or {}).get("id") or 0)
    save_cached_json_for(cache_key, {"id": resolved}, 7 * 86400 if resolved else 300)
    return resolved


def resolve_dandan_episode(title: str, episode_name: str = "", year: int = 0, tmdb_id: int = 0,
                           media_type: str = "", season: int = 0, episode: int = 0):
    number = episode_number(episode_name, episode)
    identity_key = media_identity_key(title, year, tmdb_id, media_type, season, number)
    with db() as conn:
        saved = conn.execute("SELECT * FROM media_identities WHERE identity_key=?", (identity_key,)).fetchone()
    if saved and saved["dandan_episode_id"]:
        return dict(saved)

    # Try the domestic title service first when no ID was supplied. TMDB being
    # unreachable must not delay an otherwise successful danmaku lookup.
    lookup_tmdb = tmdb_id
    variants = dandan_title_variants(title)
    if not variants and lookup_tmdb <= 0:
        raise HTTPException(422, "缺少可用于匹配弹幕的片名")
    anime, item = None, None
    def choose(animes, by_id=False):
        ranked = sorted(animes, key=lambda a: dandan_title_score(a, variants), reverse=True)
        for candidate in ranked:
            if not by_id and dandan_title_score(candidate, variants) <= 0:
                continue
            chosen = pick_dandan_episode(candidate, number)
            if chosen:
                return candidate, chosen
        return None, None

    # An explicit ID remains the preferred route.
    if lookup_tmdb > 0:
        for with_number in ((number,) if number > 0 else ()) + (0,):
            animes = dandan_search_animes("", with_number, lookup_tmdb)
            anime, item = choose(animes, by_id=True)
            if item:
                break
    # 第一轮：片名 + 集数过滤；第二轮：只用片名搜索，再在结果里按集数挑选。
    if anime is None:
        for with_number in ((number,) if number > 0 else ()) + (0,):
            for keyword in variants:
                animes = dandan_search_animes(keyword, with_number)
                anime, item = choose(animes)
                if item:
                    break
            if anime is not None:
                break
    if item is None and tmdb_id <= 0:
        lookup_tmdb = resolve_tmdb_id_by_title(title, year, media_type)
        if lookup_tmdb:
            for with_number in ((number,) if number > 0 else ()) + (0,):
                anime, item = choose(dandan_search_animes("", with_number, lookup_tmdb), by_id=True)
                if item:
                    break
    if anime is None or item is None:
        raise HTTPException(404, "未找到匹配的弹幕库（可在播放页长按“弹幕”手动关联 EpisodeId）")
    now = int(time.time())
    record = {
        "identity_key": identity_key, "media_type": media_type, "title": title, "content_year": year,
        "tmdb_id": lookup_tmdb or tmdb_id, "imdb_id": "", "season_number": season, "episode_number": number,
        "dandan_episode_id": int(item.get("episodeId")), "dandan_title": anime.get("animeTitle") or title,
        "emby_item_id": "", "match_confidence": 90 if lookup_tmdb else 70,
        "manually_confirmed": 0, "updated_at": now,
    }
    with db() as conn:
        conn.execute("""INSERT INTO media_identities(identity_key,media_type,title,content_year,tmdb_id,imdb_id,
          season_number,episode_number,dandan_episode_id,dandan_title,emby_item_id,match_confidence,
          manually_confirmed,updated_at) VALUES(:identity_key,:media_type,:title,:content_year,:tmdb_id,:imdb_id,
          :season_number,:episode_number,:dandan_episode_id,:dandan_title,:emby_item_id,:match_confidence,
          :manually_confirmed,:updated_at)
          ON CONFLICT(identity_key) DO UPDATE SET dandan_episode_id=excluded.dandan_episode_id,
          dandan_title=excluded.dandan_title,match_confidence=excluded.match_confidence,updated_at=excluded.updated_at""", record)
    return record


def local_danmaku_comments(identity_key: str, episode_id: int):
    with db() as conn:
        rows = conn.execute("""SELECT time_ms,mode,color,text FROM local_danmaku
          WHERE identity_key=? OR (dandan_episode_id>0 AND dandan_episode_id=?)
          ORDER BY time_ms LIMIT 2000""", (identity_key, episode_id)).fetchall()
    return [{"p": f"{row['time_ms'] / 1000.0:.2f},{row['mode']},{row['color']},[continuebox]",
             "m": row["text"]} for row in rows]


def dandan_comments(episode_id: int):
    key = f"dandan:comments:{episode_id}"
    cached, expires = cached_json(key)
    if cached is not None and (not isinstance(cached, dict) or cached.get("success") is False
                               or not isinstance(cached.get("comments"), list)):
        cached, expires = None, None
    if cached is not None and expires and expires > int(time.time()):
        return cached, True
    path = f"/api/v2/comment/{episode_id}"
    try:
        headers = dandan_headers(path)
        status, payload = json_request("GET", DANDAN_API_BASE + path + "?withRelated=true&chConvert=1",
                                       headers=headers)
    except HTTPException:
        if cached is not None:
            return cached, True
        raise
    if status in (401, 403):
        if cached is not None:
            return cached, True
        raise HTTPException(502, f"弹弹play拒绝访问（HTTP {status}）：请确认 AppId/AppSecret 是"
                                 "开放平台审核通过后下发的凭证，并检查飞牛系统时间是否准确")
    if (status != 200 or not isinstance(payload, dict) or payload.get("success") is False
            or not isinstance(payload.get("comments"), list)):
        if cached is not None:
            return cached, True
        raise HTTPException(502, f"弹弹play弹幕获取失败（HTTP {status}）")
    # A fresh episode may have no comments yet. Do not freeze that result for six hours.
    save_cached_json_for(key, payload, DANDAN_CACHE_SECONDS if payload["comments"] else 60)
    return payload, False




def comments_xml(payload: dict):
    parts = ["<i>"]
    seen = set()
    for item in payload.get("comments") or []:
        if not isinstance(item, dict):
            continue
        param, message = str(item.get("p") or ""), str(item.get("m") or "")
        message = re.sub(r"[\x00-\x08\x0b\x0c\x0e-\x1f]", "", message).strip()[:500]
        if param and message:
            # DandanPlay v2 uses time,mode,color,user while the Android renderer and
            # common Bilibili XML format use time,mode,fontSize,color.
            values = param.split(",")
            try:
                seconds, mode, color = float(values[0]), int(values[1]), int(values[2])
                if not math.isfinite(seconds) or not 0 <= seconds <= 86400 or mode not in (1, 4, 5) or not 0 <= color <= 16777215:
                    continue
            except (ValueError, IndexError, OverflowError):
                continue
            identity = (round(seconds, 2), mode, color, message)
            if identity in seen:
                continue
            seen.add(identity)
            param = f"{seconds:.2f},{mode},25,{color}"
            parts.append(f'<d p="{html.escape(param, quote=True)}">{html.escape(message)}</d>')
            if len(seen) >= 30000:
                break
    parts.append("</i>")
    return "".join(parts)


def account_danmaku_identity(user_id, title, episode_name, year, tmdb_id, media_type, season, episode):
    key = media_identity_key(title, year, tmdb_id, media_type, season, episode_number(episode_name, episode))
    with db() as conn:
        row = conn.execute("SELECT episode_id,title FROM user_danmaku_links WHERE user_id=? AND identity_key=?",
                           (user_id, key)).fetchone()
    if row:
        return {"identity_key": key, "dandan_episode_id": row[0], "dandan_title": row[1], "match_confidence": 100}
    return resolve_dandan_episode(title, episode_name, year, tmdb_id, media_type, season, episode)


def ass_time(seconds: float):
    value = max(0, int(seconds * 100))
    hours, value = divmod(value, 360000)
    minutes, value = divmod(value, 6000)
    whole, centiseconds = divmod(value, 100)
    return f"{hours}:{minutes:02d}:{whole:02d}.{centiseconds:02d}"


def ass_color(rgb: int):
    rgb = max(0, min(0xFFFFFF, rgb))
    return f"&H{rgb & 0xFF:02X}{(rgb >> 8) & 0xFF:02X}{(rgb >> 16) & 0xFF:02X}&"


def danmaku_xml_to_ass(xml: str):
    header = """[Script Info]
ScriptType: v4.00+
PlayResX: 1920
PlayResY: 1080
WrapStyle: 2
ScaledBorderAndShadow: yes

[V4+ Styles]
Format: Name,Fontname,Fontsize,PrimaryColour,SecondaryColour,OutlineColour,BackColour,Bold,Italic,Underline,StrikeOut,ScaleX,ScaleY,Spacing,Angle,BorderStyle,Outline,Shadow,Alignment,MarginL,MarginR,MarginV,Encoding
Style: Danmaku,Arial,42,&H00FFFFFF,&H00FFFFFF,&H80000000,&H40000000,0,0,0,0,100,100,0,0,1,2,0,7,0,0,0,1

[Events]
Format: Layer,Start,End,Style,Name,MarginL,MarginR,MarginV,Effect,Text
"""
    try:
        root = ET.fromstring(xml)
    except ET.ParseError:
        return header
    lines = [header]
    lane = 0
    for node in root.findall(".//d"):
        values = (node.attrib.get("p") or "").split(",")
        if len(values) < 3 or not (node.text or "").strip():
            continue
        try:
            start, mode, color = float(values[0]), int(values[1]), int(values[3])
        except ValueError:
            continue
        text = (node.text or "").replace("\\", "\\\\").replace("{", "\\{").replace("}", "\\}").replace("\n", " ")
        color_tag = "\\c" + ass_color(color)
        if mode == 4:
            effect, duration = "\\an2\\pos(960,1010)", 5.0
        elif mode == 5:
            effect, duration = "\\an8\\pos(960,70)", 5.0
        else:
            y = 45 + (lane % 14) * 62
            lane += 1
            effect, duration = f"\\move(1940,{y},-900,{y})", 9.0
        lines.append(f"Dialogue: 0,{ass_time(start)},{ass_time(start + duration)},Danmaku,,0,0,0,,{{{effect}{color_tag}}}{text}\n")
    return "".join(lines)


def secret_key():
    return hashlib.sha256(("continuebox-integrations\0" + TOKEN_SECRET).encode()).digest()


def seal_secret(value: str):
    nonce, plain, key = secrets.token_bytes(16), value.encode(), secret_key()
    stream = bytearray()
    counter = 0
    while len(stream) < len(plain):
        stream.extend(hmac.new(key, nonce + counter.to_bytes(4, "big"), hashlib.sha256).digest())
        counter += 1
    cipher = bytes(a ^ b for a, b in zip(plain, stream))
    tag = hmac.new(key, nonce + cipher, hashlib.sha256).digest()
    return b64(nonce + cipher + tag)


def open_secret(value: str):
    raw, key = unb64(value), secret_key()
    if len(raw) < 48:
        raise ValueError("invalid encrypted secret")
    nonce, cipher, tag = raw[:16], raw[16:-32], raw[-32:]
    if not hmac.compare_digest(tag, hmac.new(key, nonce + cipher, hashlib.sha256).digest()):
        raise ValueError("invalid encrypted secret")
    stream = bytearray()
    counter = 0
    while len(stream) < len(cipher):
        stream.extend(hmac.new(key, nonce + counter.to_bytes(4, "big"), hashlib.sha256).digest())
        counter += 1
    return bytes(a ^ b for a, b in zip(cipher, stream)).decode()


def trakt_headers(access_token: str = ""):
    headers = {"trakt-api-version": "2", "trakt-api-key": TRAKT_CLIENT_ID}
    if access_token:
        headers["Authorization"] = "Bearer " + access_token
    return headers


def save_trakt_account(user_id: int, payload: dict):
    now = int(time.time())
    expires_at = int(payload.get("created_at") or now) + int(payload.get("expires_in") or 0)
    with db() as conn:
        conn.execute("""INSERT INTO trakt_accounts(user_id,access_token,refresh_token,expires_at,scope,created_at,updated_at)
          VALUES(?,?,?,?,?,?,?) ON CONFLICT(user_id) DO UPDATE SET access_token=excluded.access_token,
          refresh_token=excluded.refresh_token,expires_at=excluded.expires_at,scope=excluded.scope,
          updated_at=excluded.updated_at""", (user_id, seal_secret(payload["access_token"]),
          seal_secret(payload["refresh_token"]), expires_at, payload.get("scope", ""), now, now))


def trakt_access_token(user_id: int):
    with db() as conn:
        account = conn.execute("SELECT * FROM trakt_accounts WHERE user_id=?", (user_id,)).fetchone()
    if not account:
        raise HTTPException(409, "尚未绑定 Trakt")
    try:
        access_token = open_secret(account["access_token"])
        if account["expires_at"] > int(time.time()) + 300:
            return access_token
        refresh_token = open_secret(account["refresh_token"])
    except Exception as exc:
        raise HTTPException(500, "Trakt 凭证无法解密，请重新绑定") from exc
    status, payload = json_request("POST", TRAKT_API_BASE + "/oauth/token", payload={
        "refresh_token": refresh_token, "client_id": TRAKT_CLIENT_ID, "client_secret": TRAKT_CLIENT_SECRET,
        "grant_type": "refresh_token", "redirect_uri": "urn:ietf:wg:oauth:2.0:oob",
    })
    if status != 200:
        raise HTTPException(502, "Trakt 登录已过期，请重新绑定")
    save_trakt_account(user_id, payload)
    return payload["access_token"]


def neodb_headers(access_token: str):
    return {"Authorization": "Bearer " + access_token}


def neodb_access_token(user_id: int):
    with db() as conn:
        account = conn.execute("SELECT access_token FROM neodb_accounts WHERE user_id=?", (user_id,)).fetchone()
    if not account:
        raise HTTPException(409, "尚未绑定 NeoDB")
    try:
        return open_secret(account["access_token"])
    except Exception as exc:
        raise HTTPException(500, "NeoDB 凭证无法解密，请重新绑定") from exc


def pick_neodb_result(results: list, title: str, year: int):
    normalized = "".join(c.lower() for c in title if c.isalnum())

    def score(item):
        names = [item.get("title"), item.get("display_title"), item.get("orig_title")]
        names.extend(x.get("text") or x.get("label") for x in (item.get("localized_title") or []) if isinstance(x, dict))
        exact = any("".join(c.lower() for c in (name or "") if c.isalnum()) == normalized for name in names)
        item_year = int(item.get("year") or 0)
        return (100 if exact else 0) + (30 if year and item_year == year else 0) + min(int(item.get("rating_count") or 0), 20)

    candidates = [item for item in results if item.get("uuid")]
    return max(candidates, key=score) if candidates else None


def resolve_neodb_item(title: str, year: int, media_type: str):
    cache_key = "neodb:item:" + hashlib.sha256(f"{title.strip().lower()}|{year}|{media_type}".encode()).hexdigest()
    cached, expires = cached_json(cache_key)
    if cached is not None and expires and expires > int(time.time()):
        return cached
    query = urllib.parse.urlencode({"query": title, "category": "movie,tv"})
    status, payload = json_request("GET", NEODB_API_BASE + "/api/catalog/search?" + query)
    if status != 200:
        raise HTTPException(502, f"NeoDB 影片匹配失败（HTTP {status}）")
    item = pick_neodb_result(payload.get("data") or [], title, year)
    if not item:
        raise HTTPException(404, "NeoDB 未找到匹配影片")
    result = {"uuid": item["uuid"], "title": item.get("display_title") or item.get("title") or title,
              "url": item.get("url") or "", "category": item.get("category") or ""}
    save_cached_json_for(cache_key, result, 86400)
    return result


def report_neodb_playback(body, user_id: int, progress: float):
    if body.event == "pause" or (body.event == "stop" and (body.media_type != "movie" or progress < 90)):
        return {"reported": False, "reason": "no_shelf_change"}
    target = "complete" if body.media_type == "movie" and body.event == "stop" and progress >= 90 else "progress"
    item = resolve_neodb_item(body.title, body.year, body.media_type)
    now = int(time.time())
    with db() as conn:
        old = conn.execute("SELECT shelf_type,reported_at FROM neodb_sync_state WHERE user_id=? AND item_uuid=?",
                           (user_id, item["uuid"])).fetchone()
    if old and old["shelf_type"] == target and old["reported_at"] > now - 21600:
        return {"reported": False, "deduplicated": True, "shelf_type": target, "item": item}
    token = neodb_access_token(user_id)
    path = f"/api/me/shelf/item/{urllib.parse.quote(item['uuid'], safe='')}"
    status, existing = json_request("GET", NEODB_API_BASE + path, headers=neodb_headers(token))
    if status not in (200, 404):
        raise HTTPException(502, f"NeoDB 书架读取失败（HTTP {status}）")
    if status == 200 and existing.get("shelf_type") == "complete" and target == "progress":
        return {"reported": False, "preserved_complete": True, "shelf_type": "complete", "item": item}
    mark = {
        "shelf_type": target,
        "visibility": int(existing.get("visibility", NEODB_VISIBILITY)) if status == 200 else NEODB_VISIBILITY,
        "comment_text": (existing.get("comment_text") or "") if status == 200 else "",
        "rating_grade": int(existing.get("rating_grade") or 0) if status == 200 else 0,
        "tags": (existing.get("tags") or []) if status == 200 else [],
        "post_to_fediverse": False,
    }
    status, result = json_request("POST", NEODB_API_BASE + path, headers=neodb_headers(token), payload=mark)
    if not 200 <= status < 300:
        raise HTTPException(502, f"NeoDB 状态同步失败（HTTP {status}）")
    with db() as conn:
        conn.execute("""INSERT INTO neodb_sync_state(user_id,item_uuid,shelf_type,reported_at) VALUES(?,?,?,?)
          ON CONFLICT(user_id,item_uuid) DO UPDATE SET shelf_type=excluded.shelf_type,reported_at=excluded.reported_at""",
          (user_id, item["uuid"], target, now))
    return {"reported": True, "shelf_type": target, "item": item, "neodb": result}


def emby_account(user_id: int):
    with db() as conn:
        row = conn.execute("SELECT * FROM emby_accounts WHERE user_id=?", (user_id,)).fetchone()
    if not row:
        raise HTTPException(409, "尚未在飞牛本地配置 Emby")
    try:
        token = open_secret(row["access_token"])
    except Exception as exc:
        raise HTTPException(500, "Emby 凭证无法解密，请在飞牛重新配置") from exc
    return {"base_url": row["base_url"].rstrip("/"), "user_id": row["emby_user_id"],
            "token": token, "server_id": row["server_id"]}


def emby_headers(account: dict):
    return {"X-Emby-Token": account["token"],
            "X-Emby-Authorization": 'MediaBrowser Client="ContinueBox Sync", Device="FNOS", DeviceId="continuebox-sync", Version="' + APP_VERSION + '"'}


def emby_signed_path(kind: str, item_id: str, user_id: int, lifetime: int = 3600):
    expires = int(time.time()) + lifetime
    message = f"{kind}\n{user_id}\n{item_id}\n{expires}"
    signature = b64(hmac.new(TOKEN_SECRET.encode(), message.encode(), hashlib.sha256).digest())
    quoted = urllib.parse.quote(item_id, safe="")
    return f"/api/v1/emby/{kind}/{quoted}?uid={user_id}&exp={expires}&sig={urllib.parse.quote(signature, safe='')}"


def verify_emby_signature(kind: str, item_id: str, user_id: int, expires: int, signature: str):
    if expires < int(time.time()) or expires > int(time.time()) + 86400:
        raise HTTPException(403, "Emby 临时访问地址已失效")
    message = f"{kind}\n{user_id}\n{item_id}\n{expires}"
    expected = b64(hmac.new(TOKEN_SECRET.encode(), message.encode(), hashlib.sha256).digest())
    if not hmac.compare_digest(signature, expected):
        raise HTTPException(403, "Emby 临时访问签名无效")


def emby_get(account: dict, path: str, query: dict | None = None):
    url = account["base_url"] + path
    if query:
        url += "?" + urllib.parse.urlencode(query)
    status, payload = json_request("GET", url, headers=emby_headers(account))
    if status != 200:
        raise HTTPException(502, f"Emby 请求失败（HTTP {status}）")
    return payload


def emby_card(item: dict, base_url: str, user_id: int, image_item_id: str = ""):
    data = item.get("UserData") or {}
    position = max(0, int(data.get("PlaybackPositionTicks") or 0) // 10000)
    runtime = max(0, int(item.get("RunTimeTicks") or 0) // 10000)
    progress = round(position * 100 / runtime) if runtime else 0
    note = ""
    if data.get("Played"):
        note = "已看完"
    elif progress:
        note = f"继续 {progress}%"
    elif item.get("Type") == "Series":
        note = "剧集"
    elif item.get("ProductionYear"):
        note = str(item.get("ProductionYear"))
    if item.get("CatalogNote"):
        note = str(item["CatalogNote"])
    item_type = item.get("Type") or ""
    if item_type == "Episode":
        season = int(item.get("ParentIndexNumber") or 0)
        episode = int(item.get("IndexNumber") or 0)
        episode_label = f"S{season:02d}E{episode:02d}"
        note = episode_label + ((f" · 继续 {progress}%") if progress else "")
    image_id = image_item_id or str(item.get("SeriesId") or item.get("Id") or "")
    image = base_url + emby_signed_path("image", image_id, user_id, 3600)
    return {
        "id": str(item.get("Id") or ""),
        "name": (item.get("SeriesName") if item_type == "Episode" else item.get("Name")) or "未命名",
        "subtitle": item.get("Name") if item_type == "Episode" else "",
        "type": item_type, "year": int(item.get("ProductionYear") or 0),
        "note": note, "overview": item.get("Overview") or "", "pic": image,
        "position_ms": position, "runtime_ms": runtime, "played": bool(data.get("Played")),
    }


def emby_latest_series(items: list[dict]):
    result, seen = [], set()
    for item in items:
        if item.get("Type") != "Episode" or not item.get("SeriesId"):
            result.append(item)
            continue
        series_id = str(item["SeriesId"])
        if series_id in seen:
            continue
        seen.add(series_id)
        season = int(item.get("ParentIndexNumber") or 0)
        episode = int(item.get("IndexNumber") or 0)
        result.append({
            "Id": series_id, "Name": item.get("SeriesName") or item.get("Name") or "未命名剧集",
            "Type": "Series", "ProductionYear": item.get("ProductionYear") or 0,
            "Overview": item.get("Overview") or "", "UserData": {},
            "CatalogNote": f"更新至 S{season:02d}E{episode:02d}",
        })
    return result


def emby_playback_info(account: dict, item_id: str):
    quoted = urllib.parse.quote(item_id, safe="")
    query = urllib.parse.urlencode({"UserId": account["user_id"]})
    payload = {
        "UserId": account["user_id"], "EnableDirectPlay": True,
        "EnableDirectStream": True, "EnableTranscoding": False,
        "AutoOpenLiveStream": True,
    }
    status, result = json_request("POST", account["base_url"] + f"/Items/{quoted}/PlaybackInfo?{query}",
                                  headers=emby_headers(account), payload=payload)
    if status != 200:
        raise HTTPException(502, f"Emby 播放信息协商失败（HTTP {status}）")
    sources = result.get("MediaSources") or []
    source = next((entry for entry in sources if entry.get("SupportsDirectStream") is not False), None)
    source = source or (sources[0] if sources else None)
    if not source:
        raise HTTPException(404, "Emby 没有返回可播放的媒体源")
    return source, str(result.get("PlaySessionId") or secrets.token_hex(16))


SUBTITLE_TEXT_FORMATS = {"srt", "subrip", "ass", "ssa", "vtt", "webvtt"}


def pick_emby_subtitle(source: dict):
    """Pick the best external subtitle stream (Chinese first) from a media source."""
    candidates = [s for s in source.get("MediaStreams") or []
                  if s.get("Type") == "Subtitle" and s.get("IsExternal")]
    if not candidates:
        return None

    def score(stream):
        lang = str(stream.get("Language") or "").lower()
        title = (str(stream.get("DisplayTitle") or "") + str(stream.get("Title") or "")).lower()
        value = 0
        if lang in ("chi", "zho", "zh", "chs", "cht") or "中" in title or "chs" in title or "chi" in title:
            value += 100
        if "简" in title or "chs" in title:
            value += 10
        if stream.get("IsDefault"):
            value += 5
        if stream.get("IsForced"):
            value -= 5
        return value

    chosen = max(candidates, key=score)
    codec = str(chosen.get("Codec") or "").lower()
    if codec == "subrip":
        fmt = "srt"
    elif codec == "webvtt":
        fmt = "vtt"
    elif codec in SUBTITLE_TEXT_FORMATS:
        fmt = codec
    else:
        fmt = "srt"  # 其余格式交给 Emby 转成 srt
    return {"index": int(chosen.get("Index") or 0), "format": fmt}


def clean_emby_stream_url(account: dict, url: str):
    absolute = urllib.parse.urljoin(account["base_url"] + "/", url)
    parsed = urllib.parse.urlparse(absolute)
    account_parsed = urllib.parse.urlparse(account["base_url"])
    if (parsed.scheme, parsed.netloc) == (account_parsed.scheme, account_parsed.netloc):
        query = urllib.parse.parse_qsl(parsed.query, keep_blank_values=True)
        query = [(key, value) for key, value in query if key.lower() not in ("api_key", "x-emby-token")]
        absolute = urllib.parse.urlunparse(parsed._replace(query=urllib.parse.urlencode(query)))
    return absolute


def close_upstream(response):
    # Never put a socket with an unread response body back into the pool.
    try:
        response.close()
    finally:
        response.release_conn()


class VideoStreamResponse(StreamingResponse):
    def __init__(self, upstream, **kwargs):
        self.upstream = upstream
        super().__init__(self.chunks(), **kwargs)

    def chunks(self):
        while True:
            block = self.upstream.read1(64 * 1024, decode_content=False)
            if not block:
                break
            yield block

    async def __call__(self, scope, receive, send):
        try:
            await super().__call__(scope, receive, send)
        finally:
            # Runs even if the client disconnects before the first chunk.
            close_upstream(self.upstream)


def open_emby_stream(account: dict, url: str, range_header: str = "", method: str = "GET"):
    current = clean_emby_stream_url(account, url)
    account_origin = urllib.parse.urlparse(account["base_url"])
    for _ in range(5):
        origin = urllib.parse.urlparse(current)
        headers = {"User-Agent": "ContinueBox/" + APP_VERSION, "Accept-Encoding": "identity"}
        if (origin.scheme, origin.netloc) == (account_origin.scheme, account_origin.netloc):
            headers.update(emby_headers(account))
        if range_header:
            headers["Range"] = range_header
        response = STREAM_HTTP.request(method, current, headers=headers, preload_content=False, redirect=False)
        if response.status not in (301, 302, 303, 307, 308):
            return response
        location = response.headers.get("Location")
        close_upstream(response)
        if not location:
            break
        current = urllib.parse.urljoin(current, location)
    raise HTTPException(502, "Emby 视频重定向次数过多")


def emby_item_detail(account: dict, item_id: str):
    user = urllib.parse.quote(account["user_id"], safe="")
    item = emby_get(account, f"/Users/{user}/Items/{urllib.parse.quote(item_id, safe='')}")
    episodes = []
    if item.get("Type") == "Series":
        payload = emby_get(account, f"/Shows/{urllib.parse.quote(item_id, safe='')}/Episodes", {
            "UserId": account["user_id"], "Fields": "Overview,ProviderIds,MediaSources",
        })
        episodes = payload.get("Items") or []
        episodes.sort(key=lambda x: (int(x.get("ParentIndexNumber") or 0), int(x.get("IndexNumber") or 0)))
    return item, episodes


def playback_media_key(body):
    if getattr(body, "emby_item_id", ""):
        return "emby:" + body.emby_item_id
    external = body.tmdb_id or body.imdb_id or (body.title + ":" + str(body.year))
    if body.media_type == "episode":
        return f"episode:{external}:{body.season}:{body.episode}"
    return "movie:" + str(external)


def emby_item_score(item: dict, body):
    provider = item.get("ProviderIds") or {}
    score = 0
    if getattr(body, "emby_item_id", "") and item.get("Id") == body.emby_item_id:
        score += 1000
    if body.tmdb_id and str(provider.get("Tmdb") or provider.get("TMDb") or "") == str(body.tmdb_id):
        score += 500
    if body.imdb_id and str(provider.get("Imdb") or provider.get("IMDb") or "").lower() == body.imdb_id.lower():
        score += 500
    normalize = lambda value: "".join(c.lower() for c in (value or "") if c.isalnum())
    expected_title = body.title if body.media_type == "movie" else (getattr(body, "series_title", "") or body.title)
    actual_title = item.get("Name") if body.media_type == "movie" else (item.get("SeriesName") or item.get("Name"))
    if normalize(expected_title) and normalize(expected_title) == normalize(actual_title):
        score += 120
    if body.year and int(item.get("ProductionYear") or 0) == body.year:
        score += 40
    if body.media_type == "episode":
        if int(item.get("ParentIndexNumber") or 0) == body.season:
            score += 60
        if int(item.get("IndexNumber") or 0) == body.episode:
            score += 80
        if item.get("Type") != "Episode":
            score -= 300
    elif item.get("Type") != "Movie":
        score -= 300
    return score


def resolve_emby_item(body, user_id: int):
    account = emby_account(user_id)
    headers = emby_headers(account)
    if getattr(body, "emby_item_id", ""):
        path = f"/Users/{urllib.parse.quote(account['user_id'], safe='')}/Items/{urllib.parse.quote(body.emby_item_id, safe='')}"
        status, item = json_request("GET", account["base_url"] + path, headers=headers)
        if status == 200 and item.get("Id"):
            return account, item
    query = {
        "Recursive": "true", "IncludeItemTypes": "Movie,Episode", "SearchTerm": body.title,
        "Fields": "ProviderIds,DateCreated", "Limit": "50",
    }
    path = f"/Users/{urllib.parse.quote(account['user_id'], safe='')}/Items?" + urllib.parse.urlencode(query)
    status, payload = json_request("GET", account["base_url"] + path, headers=headers)
    if status != 200:
        raise HTTPException(502, f"Emby 媒体匹配失败（HTTP {status}）")
    items = payload.get("Items") or []
    if not items:
        raise HTTPException(404, "Emby 未找到匹配内容")
    item = max(items, key=lambda candidate: emby_item_score(candidate, body))
    if emby_item_score(item, body) < 100:
        raise HTTPException(404, "Emby 未找到可信匹配内容")
    return account, item


def report_emby_playback(body, user_id: int):
    account, item = resolve_emby_item(body, user_id)
    media_key, now = playback_media_key(body), int(time.time() * 1000)
    with db() as conn:
        old = conn.execute("SELECT * FROM emby_playback_state WHERE user_id=? AND media_key=?",
                           (user_id, media_key)).fetchone()
    # A state just imported from Emby is not immediately written back to Emby.
    if old and old["source"] == "emby" and now - old["source_updated_at"] < 30000:
        return {"reported": False, "loop_suppressed": True, "item_id": item["Id"]}
    session_id = (old["play_session_id"] if old else "") or secrets.token_hex(16)
    event = body.event
    if old and event == old["last_event"] and now - old["last_sent_at"] < 9000 \
            and abs(body.position_ms - old["position_ms"]) < 1000:
        return {"reported": False, "deduplicated": True, "item_id": item["Id"]}
    payload = {
        "ItemId": item["Id"], "PlaySessionId": session_id,
        "PositionTicks": max(0, body.position_ms) * 10000,
        "RunTimeTicks": max(0, body.duration_ms) * 10000,
        "CanSeek": True, "IsPaused": event == "pause", "IsMuted": False,
        "PlayMethod": "DirectPlay", "QueueableMediaTypes": ["Video"],
    }
    if event == "start":
        path = "/Sessions/Playing"
    elif event == "stop":
        path = "/Sessions/Playing/Stopped"
    else:
        path = "/Sessions/Playing/Progress"
        payload["EventName"] = "Pause" if event == "pause" else "TimeUpdate"
    status, _ = json_request("POST", account["base_url"] + path, headers=emby_headers(account), payload=payload)
    if not 200 <= status < 300:
        raise HTTPException(502, f"Emby 播放状态上报失败（HTTP {status}）")
    played = event == "stop" and body.position_ms * 100 >= body.duration_ms * 90
    with db() as conn:
        conn.execute("""INSERT INTO emby_playback_state
          (user_id,media_key,emby_item_id,play_session_id,position_ms,played,source,source_updated_at,
           version,last_event,last_sent_at) VALUES(?,?,?,?,?,?,?,?,1,?,?)
          ON CONFLICT(user_id,media_key) DO UPDATE SET emby_item_id=excluded.emby_item_id,
          play_session_id=excluded.play_session_id,position_ms=excluded.position_ms,played=excluded.played,
          source='continuebox',source_updated_at=excluded.source_updated_at,version=version+1,
          last_event=excluded.last_event,last_sent_at=excluded.last_sent_at""",
          (user_id, media_key, item["Id"], session_id, body.position_ms, int(played),
           "continuebox", now, event, now))
    return {"reported": True, "item_id": item["Id"], "play_session_id": session_id}


def emby_resume_state(body, user_id: int):
    account, item = resolve_emby_item(body, user_id)
    data = item.get("UserData") or {}
    position_ms = max(0, int(data.get("PlaybackPositionTicks") or 0) // 10000)
    played = bool(data.get("Played"))
    media_key, now = playback_media_key(body), int(time.time() * 1000)
    with db() as conn:
        old = conn.execute("SELECT * FROM emby_playback_state WHERE user_id=? AND media_key=?",
                           (user_id, media_key)).fetchone()
        # A recent ContinueBox check-in can be echoed by Emby; keep the newer local version.
        if old and old["source"] == "continuebox" and now - old["source_updated_at"] < 30000 \
                and abs(position_ms - old["position_ms"]) < 15000:
            return {"available": True, "item_id": item["Id"], "position_ms": old["position_ms"],
                    "played": bool(old["played"]), "source": "continuebox", "loop_suppressed": True}
        conn.execute("""INSERT INTO emby_playback_state
          (user_id,media_key,emby_item_id,position_ms,played,source,source_updated_at,version)
          VALUES(?,?,?,?,?,'emby',?,1) ON CONFLICT(user_id,media_key) DO UPDATE SET
          emby_item_id=excluded.emby_item_id,position_ms=excluded.position_ms,played=excluded.played,
          source='emby',source_updated_at=excluded.source_updated_at,version=version+1""",
          (user_id, media_key, item["Id"], position_ms, int(played), now))
    return {"available": True, "item_id": item["Id"], "position_ms": position_ms,
            "played": played, "source": "emby"}


def resolve_trakt_media_id(title: str, year: int, media_type: str, tmdb_id: int = 0,
                           access_token: str = ""):
    headers = trakt_headers(access_token)
    search_type = "movie" if media_type == "movie" else "show"
    if tmdb_id:
        path = f"/search/tmdb/{tmdb_id}?type={search_type}"
    else:
        query = {"query": title, "type": search_type}
        if year:
            query["years"] = year
        path = "/search/" + search_type + "?" + urllib.parse.urlencode(query)
    status, payload = json_request("GET", TRAKT_API_BASE + path, headers=headers)
    if status != 200 or not isinstance(payload, list) or not payload:
        raise HTTPException(404, "Trakt 未找到匹配内容")
    media = payload[0].get(search_type) or {}
    ids = media.get("ids") or {}
    return str(ids.get("slug") or ids.get("trakt") or "")


def review_language(text: str):
    if re.search(r"[\u3400-\u4dbf\u4e00-\u9fff]", text or ""):
        return "zh"
    return "other"


def media_reviews(title: str, year: int, media_type: str, tmdb_id: int, season: int,
                  episode: int, user_id: int):
    cache_key = "reviews:" + media_identity_key(title, year, tmdb_id, media_type, season, episode) + f":{user_id}"
    cached, expires = cached_json(cache_key)
    if cached is not None and expires and expires > int(time.time()):
        return cached | {"cached": True}
    result = media_reviews_uncached(title, year, media_type, tmdb_id, season, episode, user_id)
    if any(s.get("available") for s in result.get("sources") or []):
        save_cached_json_for(cache_key, result, REVIEWS_CACHE_SECONDS)
    return result


def fetch_tmdb_reviews(title: str, year: int, media_type: str, tmdb_id: int):
    sources, items = [], []
    if TMDB_READ_TOKEN:
        try:
            resolved_id = tmdb_id
            tmdb_type = "movie" if media_type == "movie" else "tv"
            if not resolved_id:
                search = tmdb_request("/3/search/" + tmdb_type,
                                      {"query": title, "year" if tmdb_type == "movie" else "first_air_date_year": year})
                candidate = pick_title_result(search.get("results") or [], title, year)
                resolved_id = int((candidate or {}).get("id") or 0)
            if not resolved_id:
                raise HTTPException(404, "TMDB 未找到匹配内容")
            detail = tmdb_request(f"/3/{tmdb_type}/{resolved_id}", {"language": TMDB_LANGUAGE})
            average = float(detail.get("vote_average") or 0)
            votes = int(detail.get("vote_count") or 0)
            if average > 0 and votes > 0:
                items.append({"source": "TMDB 评分概览", "kind": "rating_summary", "author": "TMDB",
                              "text": f"综合评分 {average:.1f}/10，共 {votes} 人参与评分。",
                              "rating": round(average, 1), "created_at": "", "spoiler": False,
                              "likes": 0, "language": "zh"})
            results = []
            for page in (1, 2):
                payload = tmdb_request(f"/3/{tmdb_type}/{resolved_id}/reviews", {"page": page})
                page_results = payload.get("results") or []
                results.extend(page_results)
                if page >= int(payload.get("total_pages") or 1):
                    break
            count = 0
            for entry in results[:40]:
                details = entry.get("author_details") or {}
                text = entry.get("content") or ""
                items.append({"source": "TMDB 用户影评", "kind": "review",
                              "author": entry.get("author") or details.get("username") or "TMDB 用户",
                              "text": text, "rating": details.get("rating"),
                              "created_at": entry.get("created_at") or "", "spoiler": False,
                              "likes": 0, "url": entry.get("url") or "",
                              "language": review_language(text)})
                count += 1
            sources.append({"source": "TMDB 用户影评", "available": True, "count": count})
        except HTTPException as exc:
            sources.append({"source": "TMDB 用户影评", "available": False, "error": str(exc.detail)})
    else:
        sources.append({"source": "TMDB 用户影评", "available": False, "reason": "not_configured"})
    return sources, items


def fetch_trakt_reviews(title: str, year: int, media_type: str, tmdb_id: int, season: int,
                        episode: int, user_id: int):
    sources, items = [], []
    if TRAKT_CLIENT_ID:
        try:
            token = ""
            with db() as conn:
                connected = conn.execute("SELECT 1 FROM trakt_accounts WHERE user_id=?", (user_id,)).fetchone()
            if connected:
                token = trakt_access_token(user_id)
            trakt_id = resolve_trakt_media_id(title, year, media_type, tmdb_id, token)
            if not trakt_id:
                raise HTTPException(404, "Trakt 未找到匹配内容")
            if media_type == "episode" and season >= 0 and episode > 0:
                path = f"/shows/{urllib.parse.quote(trakt_id, safe='')}/seasons/{season}/episodes/{episode}/comments/newest"
            elif media_type == "movie":
                path = f"/movies/{urllib.parse.quote(trakt_id, safe='')}/comments/newest"
            else:
                path = f"/shows/{urllib.parse.quote(trakt_id, safe='')}/comments/newest"
            status, payload = json_request("GET", TRAKT_API_BASE + path + "?page=1&limit=100",
                                           headers=trakt_headers(token))
            if status != 200:
                raise HTTPException(502, f"Trakt 评论读取失败（HTTP {status}）")
            trakt_count = 0
            for entry in payload if isinstance(payload, list) else []:
                user = entry.get("user") or {}
                text = entry.get("comment") or ""
                items.append({"source": "Trakt 社区评论", "kind": "review" if entry.get("review") else "comment",
                              "author": user.get("name") or user.get("username") or "Trakt 用户",
                              "text": text, "rating": entry.get("user_rating"),
                              "created_at": entry.get("created_at") or "", "spoiler": bool(entry.get("spoiler")),
                              "likes": int(entry.get("likes") or 0), "language": review_language(text)})
                trakt_count += 1
            sources.append({"source": "Trakt 社区评论", "available": True, "count": trakt_count})
        except HTTPException as exc:
            sources.append({"source": "Trakt 社区评论", "available": False, "error": str(exc.detail)})
    else:
        sources.append({"source": "Trakt 社区评论", "available": False, "reason": "not_configured"})
    return sources, items


def fetch_neodb_reviews(title: str, year: int, media_type: str, user_id: int):
    sources, items = [], []
    with db() as conn:
        neodb_connected = conn.execute("SELECT 1 FROM neodb_accounts WHERE user_id=?", (user_id,)).fetchone()
    if NEODB_CLIENT_ID and NEODB_CLIENT_SECRET and neodb_connected:
        try:
            media = resolve_neodb_item(title, year, media_type)
            token = neodb_access_token(user_id)
            path = f"/api/me/shelf/item/{urllib.parse.quote(media['uuid'], safe='')}"
            status, shelf = json_request("GET", NEODB_API_BASE + path, headers=neodb_headers(token))
            count = 0
            if status == 200 and (shelf.get("comment_text") or shelf.get("rating_grade")):
                text = shelf.get("comment_text") or "（仅评分）"
                items.append({"source": "NeoDB 我的短评", "kind": "personal_review", "author": "我",
                              "text": text,
                              "rating": shelf.get("rating_grade"), "created_at": "", "spoiler": False,
                              "likes": 0, "visibility": shelf.get("visibility"),
                              "language": review_language(text)})
                count = 1
            elif status not in (200, 404):
                raise HTTPException(502, f"NeoDB 短评读取失败（HTTP {status}）")
            sources.append({"source": "NeoDB 我的短评", "available": True, "count": count,
                            "scope": "current_user_only"})
            # 条目公开短评（联邦宇宙用户，含大量中文内容）。接口在部分实例可能不存在：
            # 失败只标记该来源不可用，不影响其他来源。
            try:
                path = f"/api/item/{urllib.parse.quote(media['uuid'], safe='')}/posts/"
                status, posts = json_request("GET", NEODB_API_BASE + path + "?type=comment&page=1",
                                             headers=neodb_headers(token))
                public_count = 0
                if status == 200:
                    entries = posts.get("data") if isinstance(posts, dict) else posts
                    for entry in (entries or [])[:30]:
                        if not isinstance(entry, dict):
                            continue
                        text = str(entry.get("content") or entry.get("comment_text") or "")
                        text = re.sub(r"<[^>]+>", "", html.unescape(text)).strip()
                        if not text:
                            continue
                        account = entry.get("account") or entry.get("user") or {}
                        author = str(account.get("display_name") or account.get("username")
                                     or account.get("handle") or "NeoDB 用户")
                        items.append({"source": "NeoDB 公开短评", "kind": "comment", "author": author,
                                      "text": text, "rating": entry.get("rating_grade"),
                                      "created_at": str(entry.get("created_time") or ""),
                                      "spoiler": False, "likes": 0,
                                      "language": review_language(text)})
                        public_count += 1
                    sources.append({"source": "NeoDB 公开短评", "available": True, "count": public_count})
                else:
                    sources.append({"source": "NeoDB 公开短评", "available": False,
                                    "error": f"该实例暂不提供公开短评接口（HTTP {status}）"})
            except HTTPException as exc:
                sources.append({"source": "NeoDB 公开短评", "available": False, "error": str(exc.detail)})
        except HTTPException as exc:
            sources.append({"source": "NeoDB 我的短评", "available": False, "error": str(exc.detail),
                            "scope": "current_user_only"})
    else:
        sources.append({"source": "NeoDB 我的短评", "available": False, "reason": "not_connected",
                        "scope": "current_user_only"})
    return sources, items


def fetch_local_reviews(title: str, year: int, media_type: str, tmdb_id: int,
                        season: int, episode: int):
    identity = media_identity_key(title, year, tmdb_id, media_type, season, episode)
    with db() as conn:
        rows = conn.execute("""SELECT r.text,r.rating,r.spoiler,r.created_at,u.username
                               FROM local_reviews r JOIN users u ON u.id=r.user_id
                               WHERE r.identity_key=? ORDER BY r.created_at DESC LIMIT 100""",
                            (identity,)).fetchall()
    items = []
    for row in rows:
        author = row["username"] or "续映用户"
        text = row["text"]
        items.append({"source": "续映本地评论", "kind": "comment", "author": author,
                      "text": text, "rating": row["rating"] or None,
                      "created_at": datetime.fromtimestamp(row["created_at"] / 1000).isoformat(),
                      "spoiler": bool(row["spoiler"]), "likes": 0,
                      "language": review_language(text)})
    return [{"source": "续映本地评论", "available": True, "count": len(items), "storage": "server_local"}], items


def media_reviews_uncached(title: str, year: int, media_type: str, tmdb_id: int, season: int,
                           episode: int, user_id: int):
    sources, items = [], []
    # 本地评论与三个外部来源并行读取；任何一个超时都不拖垮整体。
    with ThreadPoolExecutor(max_workers=4) as executor:
        futures = [
            executor.submit(fetch_local_reviews, title, year, media_type, tmdb_id, season, episode),
            executor.submit(fetch_tmdb_reviews, title, year, media_type, tmdb_id),
            executor.submit(fetch_trakt_reviews, title, year, media_type, tmdb_id, season, episode, user_id),
            executor.submit(fetch_neodb_reviews, title, year, media_type, user_id),
        ]
        for future in futures:
            try:
                part_sources, part_items = future.result(timeout=20)
                sources.extend(part_sources)
                items.extend(part_items)
            except FuturesTimeoutError:
                sources.append({"source": "评论来源", "available": False, "error": "读取超时"})
            except Exception as exc:
                sources.append({"source": "评论来源", "available": False, "error": str(exc)})
    items.sort(key=lambda entry: (
        0 if entry.get("kind") == "personal_review" else 1,
        0 if entry.get("language") == "zh" else 1,
        0 if entry.get("kind") == "rating_summary" else 1,
        -int(entry.get("likes") or 0),
    ))
    chinese_count = sum(1 for entry in items if entry.get("language") == "zh"
                        and entry.get("kind") != "rating_summary")
    other_count = sum(1 for entry in items if entry.get("language") != "zh")
    return {"title": title, "items": items, "sources": sources,
            "language_summary": {"zh": chinese_count, "other": other_count},
            "notice": "评论/评价是独立阅读内容，不是按播放时间出现的动态弹幕；中文内容优先显示，其他语言保留原文。"}


def image_url(path: str | None, size: str = "w185"):
    return TMDB_IMAGE_BASE + size + path if path else ""


def title_match_variants(name: str):
    raw = (name or "").strip().replace("_", " ")
    variants = []
    for value in (clean_media_title(raw), raw):
        value = re.sub(r"(?i)\s+(?:S(?:eason)?\s*\d{1,2}|第[0-9一二三四五六七八九十]+季)\s*$", "", value).strip()
        value = re.sub(r"\s*[（(]?((?:19|20)\d{2})[）)]?\s*$", "", value).strip()
        if value and value not in variants:
            variants.append(value)
        for part in re.split(r"\s+(?:/|\||｜)\s+", value):
            part = part.strip()
            if len(part) >= 2 and part not in variants:
                variants.append(part)
    return variants or ([raw] if raw else [])


def title_result_score(item: dict, name: str, year: int, media_type: str = ""):
    wanted_values = [normalize_title(value) for value in title_match_variants(name)]
    wanted_values = [value for value in wanted_values if value]
    titles = [normalize_title(item.get(key) or "") for key in
              ("title", "name", "original_title", "original_name")]
    titles = [value for value in titles if value]
    if not wanted_values or not titles:
        return -1000
    similarity = max(SequenceMatcher(None, wanted, title).ratio()
                     for wanted in wanted_values for title in titles)
    exact = any(wanted == title for wanted in wanted_values for title in titles)
    contained = any(min(len(wanted), len(title)) >= 2
                    and (wanted in title or title in wanted)
                    for wanted in wanted_values for title in titles)
    date = item.get("release_date") or item.get("first_air_date") or ""
    item_year = int(date[:4]) if len(date) >= 4 and date[:4].isdigit() else 0
    year_score = 0
    if year and item_year:
        gap = abs(item_year - year)
        year_score = 42 if gap == 0 else 22 if gap == 1 else 5 if gap == 2 else -min(48, gap * 10)
    item_type = item.get("media_type") or ""
    type_score = 0
    if media_type and item_type:
        type_score = 28 if item_type == media_type else -45
    return ((220 if exact else 105 if contained else 0)
            + similarity * 105 + year_score + type_score
            + min(float(item.get("popularity", 0)), 12)
            + min(float(item.get("vote_count", 0)) ** .5, 8))


def pick_title_result(results: list, name: str, year: int, media_type: str = ""):
    if not results:
        return None
    best = max(results, key=lambda item: title_result_score(item, name, year, media_type))
    # A TMDB search always returns something for broad terms. Reject weak
    # candidates instead of attaching the wrong cast, plot and recommendations.
    return best if title_result_score(best, name, year, media_type) >= 78 else None


def compact_work(item: dict):
    media = item.get("media_type", "")
    title = item.get("title") or item.get("name") or ""
    date = item.get("release_date") or item.get("first_air_date") or ""
    return {
        "id": item.get("id"), "media_type": media, "title": title,
        "year": date[:4] if len(date) >= 4 else "", "poster_url": image_url(item.get("poster_path"), "w342"),
        "backdrop_url": image_url(item.get("backdrop_path"), "w780"),
        "character": item.get("character", ""), "job": item.get("job", ""),
        "overview": item.get("overview", ""), "vote_average": round(float(item.get("vote_average") or 0), 1),
        "popularity": item.get("popularity", 0),
    }


def rewrite_meta_images(payload: dict, request: Request):
    """把 TMDB 图片地址换成本服务器中转地址，避免客户端直连 image.tmdb.org 失败。"""
    base = str(request.base_url).rstrip("/") + "/api/v1/meta/image/"

    def rewrite(value):
        if isinstance(value, str) and value.startswith(TMDB_IMAGE_BASE):
            return base + value[len(TMDB_IMAGE_BASE):]
        return value

    out = dict(payload)
    if "profile_url" in out:
        out["profile_url"] = rewrite(out["profile_url"])
    if "backdrop_url" in out:
        out["backdrop_url"] = rewrite(out["backdrop_url"])
    out["people"] = [dict(person) | {"profile_url": rewrite(person.get("profile_url"))}
                     for person in out.get("people") or []]
    out["organizations"] = [dict(entity) | {"logo_url": rewrite(entity.get("logo_url"))}
                            for entity in out.get("organizations") or []]
    if "logo_url" in out:
        out["logo_url"] = rewrite(out["logo_url"])
    out["works"] = [dict(work) | {"poster_url": rewrite(work.get("poster_url"))}
                    for work in out.get("works") or []]
    out["recommendations"] = [dict(work) | {
                                  "poster_url": rewrite(work.get("poster_url")),
                                  "backdrop_url": rewrite(work.get("backdrop_url"))
                              }
                              for work in out.get("recommendations") or []]
    out["episodes"] = [dict(episode) | {"still_url": rewrite(episode.get("still_url"))}
                       for episode in out.get("episodes") or []]
    if not out["people"]:
        out.pop("people")
    if not out["organizations"]:
        out.pop("organizations")
    if not out["works"]:
        out.pop("works")
    if not out["recommendations"]:
        out.pop("recommendations")
    if not out["episodes"]:
        out.pop("episodes")
    return out


def unb64(data: str) -> bytes:
    return base64.urlsafe_b64decode(data + "=" * (-len(data) % 4))


def password_hash(password: str, salt: bytes | None = None) -> str:
    salt = salt or secrets.token_bytes(16)
    with PASSWORD_HASH_SLOTS:
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
        user_id = int(claims["uid"])
        with db() as conn:
            if not conn.execute("SELECT id FROM users WHERE id=?", (user_id,)).fetchone():
                raise ValueError
            security.validate_session(conn, claims, user_id)
        return user_id
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
    content_key: str = Field(default="", max_length=128)
    content_year: int = Field(default=0, ge=0, le=3000)
    episode_key: str = Field(default="", max_length=128)

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


class FavoriteItem(BaseModel):
    source_key: str = Field(min_length=1, max_length=100)
    video_id: str = Field(min_length=1, max_length=500)
    name: str = Field(default="", max_length=300)
    pic: str = Field(default="", max_length=1000)
    deleted: bool = False
    updated_at: int = Field(gt=0)

    @field_validator("updated_at")
    @classmethod
    def reasonable_time(cls, value: int):
        if value > int(time.time() * 1000) + 86400000:
            raise ValueError("更新时间不能超过服务器时间一天")
        return value

    def key(self):
        raw = "\0".join((self.source_key, self.video_id)).encode()
        return hashlib.sha256(raw).hexdigest()


class FavoritesPushBody(BaseModel):
    device_id: str = Field(min_length=1, max_length=100)
    records: list[FavoriteItem] = Field(max_length=500)


class SearchHistoryItem(BaseModel):
    title: str = Field(min_length=1, max_length=200)
    deleted: bool = False
    updated_at: int = Field(gt=0)

    @field_validator("updated_at")
    @classmethod
    def reasonable_time(cls, value: int):
        if value > int(time.time() * 1000) + 86400000:
            raise ValueError("更新时间不能超过服务器时间一天")
        return value

    def key(self):
        return hashlib.md5(self.title.strip().lower().encode("utf-8")).hexdigest()


class SearchHistoryPushBody(BaseModel):
    device_id: str = Field(min_length=1, max_length=100)
    records: list[SearchHistoryItem] = Field(max_length=500)


class AccountSettingsBody(BaseModel):
    snapshot: str = Field(min_length=2, max_length=5_000_000)
    snapshot_hash: str = Field(min_length=64, max_length=64, pattern=r"^[0-9a-f]{64}$")
    base_revision: int = Field(default=0, ge=0)
    device_id: str = Field(default="", max_length=100)


class DanmakuSend(BaseModel):
    title: str = Field(min_length=1, max_length=300)
    episode_name: str = Field(default="", max_length=300)
    year: int = Field(default=0, ge=0, le=3000)
    tmdb_id: int = Field(default=0, ge=0)
    media_type: str = Field(default="", pattern=r"^(|movie|tv|episode)$")
    season: int = Field(default=0, ge=0, le=10000)
    episode: int = Field(default=0, ge=0, le=100000)
    position_ms: int = Field(ge=0)
    text: str = Field(min_length=1, max_length=100)
    mode: int = Field(default=1)
    color: int = Field(default=16777215, ge=0, le=16777215)

    @field_validator("mode")
    @classmethod
    def supported_mode(cls, value: int):
        if value not in (1, 4, 5):
            raise ValueError("弹幕模式只能是滚动、顶部或底部")
        return value


class DanmakuLink(BaseModel):
    title: str = Field(min_length=1, max_length=300)
    episode_name: str = Field(default="", max_length=300)
    year: int = Field(default=0, ge=0, le=3000)
    tmdb_id: int = Field(default=0, ge=0)
    media_type: str = Field(default="", pattern=r"^(|movie|tv|episode)$")
    season: int = Field(default=0, ge=0, le=10000)
    episode: int = Field(default=0, ge=0, le=100000)
    dandan_episode_id: int = Field(gt=0)
    dandan_title: str = Field(default="", max_length=300)


class PlaybackEvent(BaseModel):
    event: str = Field(pattern=r"^(start|progress|pause|stop)$")
    media_type: str = Field(pattern=r"^(movie|episode)$")
    title: str = Field(min_length=1, max_length=300)
    year: int = Field(default=0, ge=0, le=3000)
    tmdb_id: int = Field(default=0, ge=0)
    imdb_id: str = Field(default="", max_length=32)
    season: int = Field(default=0, ge=0, le=10000)
    episode: int = Field(default=0, ge=0, le=100000)
    series_title: str = Field(default="", max_length=300)
    emby_item_id: str = Field(default="", max_length=200)
    position_ms: int = Field(ge=0)
    duration_ms: int = Field(gt=0)


class MediaLookup(BaseModel):
    media_type: str = Field(pattern=r"^(movie|episode)$")
    title: str = Field(min_length=1, max_length=300)
    year: int = Field(default=0, ge=0, le=3000)
    tmdb_id: int = Field(default=0, ge=0)
    imdb_id: str = Field(default="", max_length=32)
    season: int = Field(default=0, ge=0, le=10000)
    episode: int = Field(default=0, ge=0, le=100000)
    series_title: str = Field(default="", max_length=300)
    emby_item_id: str = Field(default="", max_length=200)


class ReviewPost(BaseModel):
    source: str = Field(pattern=r"^(local|neodb|trakt)$")
    media_type: str = Field(pattern=r"^(movie|episode|show)$")
    title: str = Field(min_length=1, max_length=300)
    year: int = Field(default=0, ge=0, le=3000)
    tmdb_id: int = Field(default=0, ge=0)
    season: int = Field(default=0, ge=0, le=10000)
    episode: int = Field(default=0, ge=0, le=100000)
    text: str = Field(min_length=1, max_length=2000)
    rating: int = Field(default=0, ge=0, le=10)
    spoiler: bool = False
    visibility: int = Field(default=NEODB_VISIBILITY, ge=0, le=2)


class NeoDBAuthCode(BaseModel):
    code: str = Field(min_length=4, max_length=1000)


@app.get("/health")
def health():
    return {
        "ok": True,
        "version": APP_VERSION,
        "features": ["sequence_cursor", "cross_source_progress", "tmdb_metadata", "tmdb_recommendations", "tmdb_person_search", "tmdb_organization_works",
                      "media_identity", "dandan_danmaku", "trakt_device_auth", "trakt_scrobble",
                     "neodb_oauth", "neodb_shelf_sync", "account_settings_sync", "media_reviews",
                     "emby_playback_checkins", "emby_resume_pull", "emby_loop_suppression",
                     "emby_catalog", "emby_secure_stream_gateway", "emby_playback_negotiation",
                     "emby_strm_redirect_proxy", "reviews_chinese_first", "review_posting",
                     "emby_search", "emby_external_subtitles", "favorites_sync",
                     "emby_search_xiaoya_fallback", "search_history_sync", "local_reviews",
                     "status_dashboard"],
        "tmdb_configured": bool(TMDB_READ_TOKEN),
        "dandan_configured": bool((DANDAN_APP_ID and DANDAN_APP_SECRET)
                                  or DANDAN_API_BASE != DANDAN_OFFICIAL_BASE),
        "trakt_configured": bool(TRAKT_CLIENT_ID and TRAKT_CLIENT_SECRET),
        "neodb_configured": bool(NEODB_CLIENT_ID and NEODB_CLIENT_SECRET),
        "emby_configured_per_account": True,
        "server_time": int(time.time() * 1000),
    }


def server_stats():
    with db() as conn:
        values = {
            "users": conn.execute("SELECT COUNT(*) FROM users").fetchone()[0],
            "history": conn.execute("SELECT COUNT(*) FROM records WHERE deleted=0").fetchone()[0],
            "favorites": conn.execute("SELECT COUNT(*) FROM favorites WHERE deleted=0").fetchone()[0],
            "search_terms": conn.execute("SELECT COUNT(*) FROM search_history WHERE deleted=0").fetchone()[0],
            "danmaku": conn.execute("SELECT COUNT(*) FROM local_danmaku").fetchone()[0],
            "reviews": conn.execute("SELECT COUNT(*) FROM local_reviews").fetchone()[0],
            "devices": conn.execute("SELECT COUNT(DISTINCT device_id) FROM records WHERE device_id<>''").fetchone()[0],
            "last_sync_at": conn.execute("SELECT COALESCE(MAX(server_updated_at),0) FROM records").fetchone()[0],
        }
    with REQUEST_METRICS_LOCK:
        metrics = dict(REQUEST_METRICS)
    values.update({
        "ok": True,
        "version": APP_VERSION,
        "uptime_seconds": max(0, int(time.time()) - APP_STARTED_AT),
        "requests": metrics["requests"],
        "errors": metrics["errors"],
        "average_ms": round(metrics["total_ms"] / max(1, metrics["requests"]), 1),
        "last_request_at": metrics["last_request_at"],
        "database_bytes": DB_PATH.stat().st_size if DB_PATH.exists() else 0,
        "integrations": {
            "tmdb": bool(TMDB_READ_TOKEN),
            "dandan": bool((DANDAN_APP_ID and DANDAN_APP_SECRET)
                            or DANDAN_API_BASE != DANDAN_OFFICIAL_BASE),
            "trakt": bool(TRAKT_CLIENT_ID and TRAKT_CLIENT_SECRET),
            "neodb": bool(NEODB_CLIENT_ID and NEODB_CLIENT_SECRET),
            "emby": True,
        },
    })
    return values


@app.get("/api/v1/stats")
def stats():
    """Aggregate-only diagnostics: never returns usernames, titles, tokens or cookies."""
    return server_stats()


@app.get("/dashboard", response_class=HTMLResponse)
def dashboard():
    page = r'''<!doctype html><html lang="zh-CN"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1"><title>续映服务状态</title>
<style>:root{color-scheme:dark;--bg:#0b1118;--card:#16212d;--line:#26394b;--blue:#60cdff;--muted:#91a2b4}
*{box-sizing:border-box}body{margin:0;background:radial-gradient(circle at 15% 0,#12334b 0,transparent 38%),var(--bg);font:15px system-ui;color:#eef6ff}
main{max-width:1040px;margin:auto;padding:42px 24px}.head{display:flex;align-items:end;justify-content:space-between;gap:20px}.brand{font-size:30px;font-weight:750;letter-spacing:.04em}.brand b{color:var(--blue)}
.sub,.foot{color:var(--muted);margin-top:8px}.ok{color:#71e6b6}.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));gap:14px;margin:28px 0}.card,.panel{background:linear-gradient(145deg,#182532,#111b25);border:1px solid var(--line);border-radius:18px;padding:20px;box-shadow:0 12px 35px #0005}.n{font-size:30px;font-weight:700;margin-top:9px}.label{color:var(--muted)}
.panels{display:grid;grid-template-columns:1.2fr .8fr;gap:14px}.row{display:flex;justify-content:space-between;padding:11px 0;border-bottom:1px solid #ffffff0c}.row:last-child{border:0}.dot{display:inline-block;width:8px;height:8px;border-radius:50%;margin-right:8px;background:#71e6b6}.off .dot{background:#66798b}.off{color:var(--muted)}
@media(max-width:700px){main{padding:25px 16px}.panels{grid-template-columns:1fr}.head{align-items:start;flex-direction:column}}</style></head>
<body><main><div class="head"><div><div class="brand"><b>C</b>ontinueBox 服务端</div><div class="sub">同步、元数据与媒体服务运行概览</div></div><div id="health" class="ok">● 正在连接</div></div>
<section class="grid" id="cards"></section><section class="panels"><div class="panel"><div class="label">运行状态</div><div id="runtime"></div></div><div class="panel"><div class="label">外部服务</div><div id="integrations"></div></div></section><div class="foot">页面每 15 秒自动更新，只显示汇总数字，不展示用户名、片名、令牌或网盘凭据。</div></main>
<script>const fmt=n=>new Intl.NumberFormat('zh-CN').format(n||0),time=v=>v?new Date(v).toLocaleString():'尚无记录',dur=s=>{s=Math.max(0,s|0);let d=s/86400|0,h=s%86400/3600|0,m=s%3600/60|0;return(d?d+' 天 ':'')+h+' 小时 '+m+' 分'};
async function load(){try{let d=await fetch('/api/v1/stats',{cache:'no-store'}).then(r=>r.json());health.textContent='● 运行正常 · v'+d.version;cards.innerHTML=[['用户',d.users],['设备',d.devices],['观看记录',d.history],['收藏',d.favorites],['搜索记录',d.search_terms],['本地弹幕',d.danmaku],['本地评论',d.reviews]].map(x=>`<div class="card"><div class="label">${x[0]}</div><div class="n">${fmt(x[1])}</div></div>`).join('');runtime.innerHTML=[['运行时间',dur(d.uptime_seconds)],['累计请求',fmt(d.requests)],['错误响应',fmt(d.errors)],['平均响应',d.average_ms+' ms'],['最近同步',time(d.last_sync_at)],['数据库',fmt(Math.ceil(d.database_bytes/1024))+' KB']].map(x=>`<div class="row"><span>${x[0]}</span><b>${x[1]}</b></div>`).join('');let names={tmdb:'TMDB',dandan:'弹弹play',trakt:'Trakt',neodb:'NeoDB',emby:'Emby（按账号）'};integrations.innerHTML=Object.entries(d.integrations).map(([k,v])=>`<div class="row ${v?'':'off'}"><span><i class="dot"></i>${names[k]}</span><b>${v?'已配置':'未配置'}</b></div>`).join('')}catch(e){health.textContent='● 无法读取状态';health.className='off'}}load();setInterval(load,15000)</script></body></html>'''
    return HTMLResponse(page)


@app.get("/api/v1/account/settings")
def get_account_settings(user_id: int = Depends(current_user)):
    with db() as conn:
        row = conn.execute("""SELECT encrypted_snapshot,snapshot_hash,revision,device_id,updated_at
                              FROM account_settings WHERE user_id=?""", (user_id,)).fetchone()
    if not row:
        return {"exists": False, "revision": 0}
    try:
        snapshot = open_secret(row["encrypted_snapshot"])
    except Exception:
        logger.exception("Unable to decrypt account settings for user %s", user_id)
        raise HTTPException(500, "账号配置无法解密，请检查服务器 TOKEN_SECRET 是否发生变化")
    return {"exists": True, "snapshot": snapshot, "snapshot_hash": row["snapshot_hash"],
            "revision": row["revision"], "device_id": row["device_id"],
            "updated_at": row["updated_at"]}


@app.put("/api/v1/account/settings")
def put_account_settings(body: AccountSettingsBody, user_id: int = Depends(current_user)):
    actual_hash = hashlib.sha256(body.snapshot.encode()).hexdigest()
    if not hmac.compare_digest(actual_hash, body.snapshot_hash):
        raise HTTPException(400, "配置摘要校验失败")
    now = int(time.time() * 1000)
    with db() as conn:
        current = conn.execute("SELECT snapshot_hash,revision FROM account_settings WHERE user_id=?",
                               (user_id,)).fetchone()
        if current and current["snapshot_hash"] == body.snapshot_hash:
            return {"stored": False, "revision": current["revision"],
                    "snapshot_hash": current["snapshot_hash"]}
        current_revision = current["revision"] if current else 0
        if body.base_revision != current_revision:
            raise HTTPException(409, "其他设备已更新账号配置，请先拉取最新配置")
        revision = current_revision + 1
        conn.execute("""INSERT INTO account_settings
          (user_id,encrypted_snapshot,snapshot_hash,revision,device_id,created_at,updated_at)
          VALUES(?,?,?,?,?,?,?) ON CONFLICT(user_id) DO UPDATE SET
          encrypted_snapshot=excluded.encrypted_snapshot,snapshot_hash=excluded.snapshot_hash,
          revision=excluded.revision,device_id=excluded.device_id,updated_at=excluded.updated_at""",
          (user_id, seal_secret(body.snapshot), body.snapshot_hash, revision,
           body.device_id, now, now))
    return {"stored": True, "revision": revision, "snapshot_hash": body.snapshot_hash}


@app.get("/api/v1/danmaku/comments")
def get_danmaku(title: str = Query(min_length=1, max_length=300),
                 episode_name: str = Query(default="", max_length=300),
                 year: int = Query(default=0, ge=0, le=3000), tmdb_id: int = Query(default=0, ge=0),
                 media_type: str = Query(default="", pattern=r"^(|movie|tv|episode)$"),
                 season: int = Query(default=0, ge=0), episode: int = Query(default=0, ge=0),
                 user_id: int = Depends(current_user), source_id: str = Query(default="", max_length=2048)):
    identity, identity_error = None, None
    try:
        identity = account_danmaku_identity(user_id, title, episode_name, year, tmdb_id, media_type, season, episode)
    except HTTPException as exc:
        identity_error = exc
    number = episode_number(episode_name, episode)
    identity_key = identity["identity_key"] if identity else \
        media_identity_key(title, year, tmdb_id, media_type, season, number)
    episode_id = int(identity["dandan_episode_id"]) if identity else 0
    comments, cached, upstream_error = [], False, ""
    if identity:
        try:
            payload, cached = dandan_comments(episode_id)
            comments = list(payload.get("comments") or [])
        except HTTPException as exc:
            upstream_error = str(exc.detail)
    local = local_danmaku_comments(identity_key, episode_id)
    dandan_count = len(comments)
    from . import danmaku_public
    # Direct function callers from older integrations retain the empty-source behavior.
    public, public_cached, public_error = danmaku_public.fetch(source_id if isinstance(source_id, str) else "", __import__(__name__, fromlist=["main"]))
    comments.extend(public)
    comments.extend(local)
    if not identity and not comments:
        raise identity_error
    xml = comments_xml({"comments": comments})
    return {"episode_id": episode_id,
            "matched_title": identity["dandan_title"] if identity else "",
            "match_confidence": identity["match_confidence"] if identity else 0,
            "xml": xml, "count": xml.count("<d "), "cached": cached,
            "local_count": len(local), "upstream_error": upstream_error,
            "match_error": str(identity_error.detail) if identity_error else "",
            "sources": {"dandan": {"count": dandan_count, "error": upstream_error},
                        "public": {"count": len(public), "cached": public_cached, "error": public_error},
                        "local": {"count": len(local)}}}


@app.post("/api/v1/danmaku/comments", status_code=201)
def send_danmaku(body: DanmakuSend, user_id: int = Depends(current_user)):
    security.quota([("danmaku-minute:" + str(user_id), str(int(time.time()) // 60), "danmaku_minute", 60),
                    ("danmaku-day:" + str(user_id), security.day(), "danmaku_daily", 3600)])
    if not body.text.strip():
        raise HTTPException(400, "弹幕不能为空")
    identity = None
    try:
        identity = account_danmaku_identity(user_id, body.title, body.episode_name, body.year, body.tmdb_id,
                                          body.media_type, body.season, body.episode)
    except HTTPException:
        identity = None
    number = episode_number(body.episode_name, body.episode)
    identity_key = identity["identity_key"] if identity else \
        media_identity_key(body.title, body.year, body.tmdb_id, body.media_type, body.season, number)
    episode_id = int(identity["dandan_episode_id"]) if identity else 0
    sent_upstream, upstream_error = False, ""
    if episode_id:
        # 应用弹幕接口：写入本应用的私有弹幕库。应用层级额度不足时会失败，
        # 失败不影响本地弹幕库兜底。
        with db() as conn:
            user = conn.execute("SELECT username FROM users WHERE id=?", (user_id,)).fetchone()
        path = f"/api/v2/comment/{episode_id}/app"
        try:
            status, result = json_request("POST", DANDAN_API_BASE + path, headers=dandan_headers(path), payload={
                "time": round(body.position_ms / 1000.0, 2), "mode": body.mode, "color": body.color,
                "comment": body.text.strip(), "userName": user["username"] if user else "ContinueBox",
            })
            sent_upstream = 200 <= status < 300 and isinstance(result, dict) and result.get("success") is not False
            if not sent_upstream:
                upstream_error = str((result.get("errorMessage") or result.get("message") or f"HTTP {status}") if isinstance(result, dict) else f"HTTP {status}")
        except HTTPException as exc:
            upstream_error = str(exc.detail)
        if sent_upstream:
            with db() as conn:
                conn.execute("DELETE FROM metadata_cache WHERE cache_key=?",
                             (f"dandan:comments:{episode_id}",))
    with db() as conn:
        conn.execute("""INSERT INTO local_danmaku(user_id,identity_key,dandan_episode_id,time_ms,mode,color,
          text,sent_upstream,created_at) VALUES(?,?,?,?,?,?,?,?,?)""",
          (user_id, identity_key, episode_id, body.position_ms, body.mode, body.color,
           body.text.strip(), int(sent_upstream), int(time.time())))
    return {"sent": True, "stored_local": True, "sent_upstream": sent_upstream,
            "episode_id": episode_id, "upstream_error": upstream_error}


@app.get("/api/v1/danmaku/comments.ass", response_class=PlainTextResponse)
def get_danmaku_ass(title: str = Query(min_length=1, max_length=300),
                     episode_name: str = Query(default="", max_length=300),
                     year: int = Query(default=0, ge=0, le=3000), tmdb_id: int = Query(default=0, ge=0),
                     media_type: str = Query(default="", pattern=r"^(|movie|tv|episode)$"),
                     season: int = Query(default=0, ge=0), episode: int = Query(default=0, ge=0),
                     user_id: int = Depends(current_user), source_id: str = Query(default="", max_length=2048)):
    result = get_danmaku(title, episode_name, year, tmdb_id, media_type, season, episode, user_id, source_id)
    return PlainTextResponse(danmaku_xml_to_ass(result["xml"]), media_type="text/x-ssa; charset=utf-8",
                             headers={"Content-Disposition": "inline; filename=danmaku.ass"})


@app.put("/api/v1/danmaku/link")
def link_danmaku(body: DanmakuLink, user_id: int = Depends(current_user)):
    number = episode_number(body.episode_name, body.episode)
    key = media_identity_key(body.title, body.year, body.tmdb_id, body.media_type, body.season, number)
    now = int(time.time())
    with db() as conn:
        conn.execute("""INSERT INTO user_danmaku_links(user_id,identity_key,episode_id,title)
          VALUES(?,?,?,?) ON CONFLICT(user_id,identity_key) DO UPDATE SET
          episode_id=excluded.episode_id,title=excluded.title""",
          (user_id, key, body.dandan_episode_id, body.dandan_title))
    return {"linked": True, "identity_key": key, "episode_id": body.dandan_episode_id}


@app.get("/api/v1/reviews")
def get_reviews(title: str = Query(min_length=1, max_length=300),
                year: int = Query(default=0, ge=0, le=3000),
                media_type: str = Query(default="movie", pattern=r"^(movie|episode|show)$"),
                tmdb_id: int = Query(default=0, ge=0), season: int = Query(default=0, ge=0),
                episode: int = Query(default=0, ge=0), user_id: int = Depends(current_user)):
    return media_reviews(title, year, media_type, tmdb_id, season, episode, user_id)


@app.post("/api/v1/reviews", status_code=201)
def post_review(body: ReviewPost, user_id: int = Depends(current_user)):
    text = body.text.strip()
    if not text:
        raise HTTPException(422, "评论内容不能为空")
    if body.source == "local":
        identity = media_identity_key(body.title, body.year, body.tmdb_id, body.media_type,
                                      body.season, body.episode)
        now = int(time.time() * 1000)
        with db() as conn:
            conn.execute("""INSERT INTO local_reviews(user_id,identity_key,media_type,title,content_year,
                          season_number,episode_number,text,rating,spoiler,created_at)
                          VALUES(?,?,?,?,?,?,?,?,?,?,?)""",
                         (user_id, identity, body.media_type, body.title, body.year, body.season,
                          body.episode, text, body.rating, int(body.spoiler), now))
            conn.execute("DELETE FROM metadata_cache WHERE cache_key LIKE ?", (f"reviews:{identity}:%",))
        return {"posted": True, "source": "续映本地评论", "storage": "server_local", "created_at": now}
    if body.source == "neodb":
        media = resolve_neodb_item(body.title, body.year, body.media_type)
        token = neodb_access_token(user_id)
        path = f"/api/me/shelf/item/{urllib.parse.quote(media['uuid'], safe='')}"
        status, existing = json_request("GET", NEODB_API_BASE + path, headers=neodb_headers(token))
        if status not in (200, 404):
            raise HTTPException(502, f"NeoDB 短评读取失败（HTTP {status}）")
        shelf = existing if status == 200 and isinstance(existing, dict) else {}
        payload = {
            "shelf_type": shelf.get("shelf_type") or "complete",
            "visibility": body.visibility,
            "comment_text": text,
            "rating_grade": body.rating,
            "tags": shelf.get("tags") or [],
            "post_to_fediverse": False,
        }
        status, result = json_request("POST", NEODB_API_BASE + path,
                                      headers=neodb_headers(token), payload=payload)
        if not 200 <= status < 300:
            message = result.get("detail") if isinstance(result, dict) else ""
            raise HTTPException(502, "NeoDB 短评发布失败" + ("：" + str(message) if message else f"（HTTP {status}）"))
        return {"posted": True, "source": "NeoDB 我的短评", "scope": "current_user",
                "item": media, "review": result}

    token = trakt_access_token(user_id)
    trakt_id = resolve_trakt_media_id(body.title, body.year, body.media_type, body.tmdb_id, token)
    if body.media_type == "episode":
        if body.episode <= 0:
            raise HTTPException(422, "剧集评论需要季集号")
        path = (f"/shows/{urllib.parse.quote(trakt_id, safe='')}/seasons/{body.season}"
                f"/episodes/{body.episode}")
        status, episode_info = json_request("GET", TRAKT_API_BASE + path, headers=trakt_headers(token))
        if status != 200 or not isinstance(episode_info, dict):
            raise HTTPException(502, f"Trakt 剧集匹配失败（HTTP {status}）")
        target = {"episode": {"ids": episode_info.get("ids") or {}}}
    else:
        target_name = "movie" if body.media_type == "movie" else "show"
        target = {target_name: {"ids": {"slug": trakt_id}}}
    status, result = json_request("POST", TRAKT_API_BASE + "/comments", headers=trakt_headers(token),
                                  payload={**target, "comment": text, "spoiler": body.spoiler})
    if not 200 <= status < 300:
        message = result.get("message") if isinstance(result, dict) else ""
        raise HTTPException(502, "Trakt 评论发布失败" + ("：" + str(message) if message else f"（HTTP {status}）"))
    return {"posted": True, "source": "Trakt 社区评论", "comment": result}


@app.get("/api/v1/emby/status")
def get_emby_status(user_id: int = Depends(current_user)):
    with db() as conn:
        row = conn.execute("SELECT base_url,emby_user_id,server_id,updated_at FROM emby_accounts WHERE user_id=?",
                           (user_id,)).fetchone()
    if not row:
        return {"connected": False, "configured_locally": False}
    return {"connected": True, "configured_locally": True, "base_url": row["base_url"],
            "user_id_suffix": row["emby_user_id"][-6:], "server_id": row["server_id"],
            "updated_at": row["updated_at"]}


def warm_emby_library(account: dict, user_id: int):
    try:
        emby_library_snapshot(account, user_id)
    except Exception as exc:
        logger.info("emby library warmup failed user=%s error=%s", user_id, exc)


@app.get("/api/v1/emby/catalog")
def get_emby_catalog(request: Request, background: BackgroundTasks,
                     section: str = Query(default="resume", pattern=r"^(resume|latest|movies|series)$"),
                     start: int = Query(default=0, ge=0), limit: int = Query(default=60, ge=1, le=200),
                     user_id: int = Depends(current_user)):
    account = emby_account(user_id)
    # 用户一进媒体库就后台预热全库快照，首次搜索不再等待。
    background.add_task(warm_emby_library, account, user_id)
    user = urllib.parse.quote(account["user_id"], safe="")
    query = {"Recursive": "true", "StartIndex": start, "Limit": limit,
             "Fields": "Overview,ProviderIds,PrimaryImageAspectRatio,DateCreated"}
    if section == "resume":
        query.update({"Filters": "IsResumable", "IncludeItemTypes": "Movie,Episode",
                      "SortBy": "DatePlayed", "SortOrder": "Descending"})
    elif section == "latest":
        latest_query = {"Limit": limit, "Fields": query["Fields"], "IncludeItemTypes": "Movie,Episode",
                        "GroupItems": "false", "EnableUserData": "true"}
        latest = emby_get(account, f"/Users/{user}/Items/Latest", latest_query)
        raw_items = latest if isinstance(latest, list) else (latest.get("Items") or [])
        raw_items = emby_latest_series(raw_items)
    elif section == "movies":
        query.update({"IncludeItemTypes": "Movie", "SortBy": "SortName", "SortOrder": "Ascending"})
    else:
        query.update({"IncludeItemTypes": "Series", "SortBy": "SortName", "SortOrder": "Ascending"})
    if section != "latest":
        payload = emby_get(account, f"/Users/{user}/Items", query)
        raw_items = payload.get("Items") or []
        total = int(payload.get("TotalRecordCount") or len(raw_items))
    else:
        total = len(raw_items)
    base_url = str(request.base_url).rstrip("/")
    items = [emby_card(item, base_url, user_id) for item in raw_items if item.get("Id")]
    return {"section": section, "items": items, "start": start,
            "total": total}


EMBY_LIBRARY_CACHE_SECONDS = max(120, int(os.getenv("EMBY_LIBRARY_CACHE_SECONDS", "600")))
EMBY_LIBRARY_MAX_ITEMS = 8000


def emby_library_snapshot(account: dict, user_id: int):
    """Full Movie+Series listing via the proven catalog query, cached briefly.

    小雅等聚合实现不支持标准 SearchTerm，但普通目录分页是可用的（电影库/剧集库
    页面即依赖它）。搜索时退回到这份快照做本地片名过滤。
    """
    cache_key = f"emby:library:{user_id}"
    cached, expires = cached_json(cache_key)
    if cached is not None and expires and expires > int(time.time()):
        return cached.get("items") or []
    user = urllib.parse.quote(account["user_id"], safe="")
    items, start = [], 0
    while start < EMBY_LIBRARY_MAX_ITEMS:
        query = {"Recursive": "true", "IncludeItemTypes": "Movie,Series",
                 "StartIndex": start, "Limit": 500,
                 "SortBy": "SortName", "SortOrder": "Ascending",
                 "Fields": "Overview,ProviderIds,PrimaryImageAspectRatio,DateCreated"}
        payload = emby_get(account, f"/Users/{user}/Items", query)
        page = payload.get("Items") or []
        items.extend(page)
        total = int(payload.get("TotalRecordCount") or 0)
        start += 500
        if not page or (total and start >= total):
            break
    # 只保留卡片需要的字段：8000 条全量 JSON 的缓存体积和每次搜索的反序列化
    # 开销都会显著下降；简介截断到 240 字（卡片场景足够）。
    slim = []
    for item in items:
        data = item.get("UserData") or {}
        slim.append({
            "Id": item.get("Id"), "Name": item.get("Name"), "Type": item.get("Type"),
            "ProductionYear": item.get("ProductionYear"),
            "Overview": str(item.get("Overview") or "")[:240],
            "RunTimeTicks": item.get("RunTimeTicks"),
            "SeriesId": item.get("SeriesId"), "SeriesName": item.get("SeriesName"),
            "UserData": {"PlaybackPositionTicks": data.get("PlaybackPositionTicks"),
                         "Played": data.get("Played")},
        })
    save_cached_json_for(cache_key, {"items": slim}, EMBY_LIBRARY_CACHE_SECONDS)
    return slim


@app.get("/api/v1/emby/search")
def get_emby_search(request: Request, keyword: str = Query(min_length=1, max_length=120),
                    start: int = Query(default=0, ge=0), limit: int = Query(default=60, ge=1, le=200),
                    user_id: int = Depends(current_user)):
    account = emby_account(user_id)
    user = urllib.parse.quote(account["user_id"], safe="")
    query = {"Recursive": "true", "SearchTerm": keyword.strip(), "StartIndex": start, "Limit": limit,
             "IncludeItemTypes": "Movie,Series",
             "Fields": "Overview,ProviderIds,PrimaryImageAspectRatio,DateCreated"}
    raw_items, total = None, 0
    try:
        payload = emby_get(account, f"/Users/{user}/Items", query)
        candidates = payload.get("Items")
        if isinstance(candidates, list) and candidates:
            raw_items = candidates
            total = int(payload.get("TotalRecordCount") or len(candidates))
    except HTTPException:
        raw_items = None
    if not raw_items:
        # 标准 SearchTerm 被上游拒绝（小雅返回非 JSON）或干脆忽略 SearchTerm 返回空结果：
        # 都退回全库快照 + 本地片名过滤，保证搜索可用。
        logger.info("emby search fallback user=%s keyword=%s", user_id, keyword)
        wanted = normalize_title(keyword)
        matched = [item for item in emby_library_snapshot(account, user_id)
                   if wanted and wanted in normalize_title(str(item.get("Name") or ""))]
        matched.sort(key=lambda item: (
            0 if normalize_title(str(item.get("Name") or "")).startswith(wanted) else 1,
            str(item.get("Name") or "")))
        total = len(matched)
        raw_items = matched[start:start + limit]
    base_url = str(request.base_url).rstrip("/")
    items = [emby_card(item, base_url, user_id) for item in raw_items if item.get("Id")]
    return {"keyword": keyword, "items": items, "start": start, "total": total}


@app.get("/api/v1/emby/item/{item_id}")
def get_emby_item(item_id: str, request: Request, user_id: int = Depends(current_user)):
    account = emby_account(user_id)
    item, episodes = emby_item_detail(account, item_id)
    # 从“继续观看/最新入库”点进来的是单集：改为展示所属剧集，带出完整选集列表。
    if item.get("Type") == "Episode" and item.get("SeriesId"):
        try:
            item, episodes = emby_item_detail(account, str(item["SeriesId"]))
        except HTTPException:
            pass
    base_url = str(request.base_url).rstrip("/")
    provider = item.get("ProviderIds") or {}
    actor_names = [person.get("Name") for person in item.get("People") or [] if person.get("Type") == "Actor"]
    director_names = [person.get("Name") for person in item.get("People") or [] if person.get("Type") == "Director"]
    item_type = item.get("Type") or ""
    if episodes:
        links = []
        for episode in episodes:
            season = int(episode.get("ParentIndexNumber") or 0)
            number = int(episode.get("IndexNumber") or 0)
            label = f"S{season:02d}E{number:02d} {episode.get('Name') or ''}".strip()
            links.append(label + "$" + str(episode.get("Id")))
        play_url = "#".join(links)
    elif item_type == "Episode":
        season = int(item.get("ParentIndexNumber") or 0)
        number = int(item.get("IndexNumber") or 0)
        label = f"S{season:02d}E{number:02d} {item.get('Name') or ''}".strip()
        play_url = label + "$" + str(item.get("Id") or item_id)
    else:
        play_url = "正片$" + str(item.get("Id") or item_id)
    card = emby_card(item, base_url, user_id)
    display_name = (item.get("SeriesName") if item_type == "Episode" else item.get("Name")) or "未命名"
    display_type = "剧集" if item_type in ("Series", "Episode") else "电影"
    vod = {
        "vod_id": str(item.get("Id") or item_id), "vod_name": display_name,
        "vod_pic": card["pic"], "vod_year": str(item.get("ProductionYear") or ""),
        "vod_content": item.get("Overview") or "", "vod_actor": ", ".join(actor_names),
        "vod_director": ", ".join(director_names), "vod_area": "",
        "type_name": "小雅 Emby · " + display_type,
        "vod_play_from": "小雅 Emby", "vod_play_url": play_url,
        "tmdb_id": provider.get("Tmdb") or provider.get("TMDb") or "",
        "imdb_id": provider.get("Imdb") or provider.get("IMDb") or "",
    }
    return {"list": [vod]}


@app.get("/api/v1/emby/play/{item_id}")
def get_emby_play(item_id: str, request: Request, user_id: int = Depends(current_user)):
    account = emby_account(user_id)
    user = urllib.parse.quote(account["user_id"], safe="")
    item = emby_get(account, f"/Users/{user}/Items/{urllib.parse.quote(item_id, safe='')}")
    if item.get("Type") not in ("Movie", "Episode", "Video"):
        raise HTTPException(400, "该 Emby 项目不能直接播放")
    source, play_session = emby_playback_info(account, item_id)
    params = {
        "ms": str(source.get("Id") or ""), "container": str(source.get("Container") or ""),
        "ps": play_session,
    }
    path = emby_signed_path("stream", item_id, user_id, 43200) + "&" + urllib.parse.urlencode(params)
    result = {"parse": 0, "url": str(request.base_url).rstrip("/") + path,
              "flag": "小雅 Emby", "media_source": {"container": params["container"]},
              "header": {"User-Agent": "ContinueBox/" + APP_VERSION}}
    subtitle = pick_emby_subtitle(source)
    if subtitle:
        subtitle_params = {"ms": params["ms"], "idx": subtitle["index"], "fmt": subtitle["format"]}
        subtitle_path = emby_signed_path("subtitle", item_id, user_id, 43200) \
            + "&" + urllib.parse.urlencode(subtitle_params)
        result["subt"] = str(request.base_url).rstrip("/") + subtitle_path
    else:
        streams = source.get("MediaStreams") or []
        logger.info("emby play no external subtitle user=%s item=%s streams=%s subtitle_streams=%s",
                    user_id, item_id, len(streams),
                    sum(1 for s in streams if s.get("Type") == "Subtitle"))
    return result


@app.get("/api/v1/emby/image/{item_id}")
def get_emby_image(item_id: str, uid: int, exp: int, sig: str):
    verify_emby_signature("image", item_id, uid, exp, sig)
    account = emby_account(uid)
    url = account["base_url"] + f"/Items/{urllib.parse.quote(item_id, safe='')}/Images/Primary?maxWidth=600&quality=88"
    upstream = HTTP.request("GET", url, headers=emby_headers(account))
    if upstream.status != 200:
        raise HTTPException(404, "Emby 海报不可用")
    return Response(content=upstream.data, media_type=upstream.headers.get("Content-Type", "image/jpeg"),
                    headers={"Cache-Control": "private, max-age=1800"})


@app.get("/api/v1/emby/subtitle/{item_id}")
def get_emby_subtitle(item_id: str, uid: int, exp: int, sig: str,
                      ms: str = "", idx: int = 0, fmt: str = "srt"):
    verify_emby_signature("subtitle", item_id, uid, exp, sig)
    if not re.fullmatch(r"[a-z0-9]{1,8}", fmt or ""):
        fmt = "srt"
    account = emby_account(uid)
    url = account["base_url"] + (f"/Videos/{urllib.parse.quote(item_id, safe='')}"
                                 f"/{urllib.parse.quote(ms, safe='')}/Subtitles/{max(0, int(idx))}/Stream.{fmt}")
    upstream = HTTP.request("GET", url, headers=emby_headers(account))
    if upstream.status != 200:
        raise HTTPException(404, "Emby 字幕不可用")
    media_type = {"srt": "application/x-subrip", "ass": "text/x-ssa", "ssa": "text/x-ssa",
                  "vtt": "text/vtt"}.get(fmt, "text/plain")
    return Response(content=upstream.data, media_type=media_type,
                    headers={"Cache-Control": "private, max-age=3600"})


@app.api_route("/api/v1/emby/stream/{item_id}", methods=["GET", "HEAD"])
def get_emby_stream(item_id: str, request: Request, uid: int, exp: int, sig: str,
                    ms: str = "", container: str = "", ps: str = ""):
    verify_emby_signature("stream", item_id, uid, exp, sig)
    account = emby_account(uid)
    if not ms:
        source, negotiated_session = emby_playback_info(account, item_id)
        ms = str(source.get("Id") or "")
        container = str(source.get("Container") or "")
        ps = ps or negotiated_session
        direct_url = str(source.get("DirectStreamUrl") or "")
    else:
        direct_url = ""
    if direct_url:
        url = direct_url
    else:
        suffix = "." + re.sub(r"[^a-zA-Z0-9]", "", container.split(",")[0]) if container else ""
        query = urllib.parse.urlencode({"Static": "true", "UserId": account["user_id"],
                                        "MediaSourceId": ms, "PlaySessionId": ps})
        url = account["base_url"] + f"/Videos/{urllib.parse.quote(item_id, safe='')}/stream{suffix}?{query}"
    upstream = open_emby_stream(account, url, request.headers.get("range", ""), request.method)
    if upstream.status == 416:
        content_range = upstream.headers.get("Content-Range")
        close_upstream(upstream)
        return Response(status_code=416, headers={"Content-Range": content_range} if content_range else {})
    if upstream.status not in (200, 206):
        close_upstream(upstream)
        raise HTTPException(502, f"Emby 视频流不可用（HTTP {upstream.status}）")
    response_headers = {"Cache-Control": "private, no-transform", "X-Accel-Buffering": "no"}
    for name in ("Content-Length", "Content-Range", "Accept-Ranges", "ETag", "Last-Modified", "Content-Encoding"):
        if upstream.headers.get(name):
            response_headers[name] = upstream.headers[name]
    if request.method == "HEAD":
        close_upstream(upstream)
        return Response(status_code=upstream.status, media_type=upstream.headers.get("Content-Type", "video/mp4"),
                        headers=response_headers)
    return VideoStreamResponse(upstream, status_code=upstream.status,
                             media_type=upstream.headers.get("Content-Type", "video/mp4"),
                             headers=response_headers)


@app.post("/api/v1/emby/resume")
def get_emby_resume(body: MediaLookup, user_id: int = Depends(current_user)):
    try:
        return emby_resume_state(body, user_id)
    except HTTPException as exc:
        return {"available": False, "error": str(exc.detail)}


@app.get("/api/v1/trakt/status")
def trakt_status(user_id: int = Depends(current_user)):
    with db() as conn:
        account = conn.execute("SELECT expires_at,updated_at FROM trakt_accounts WHERE user_id=?", (user_id,)).fetchone()
        pending = conn.execute("SELECT user_code,verification_url,expires_at FROM trakt_device_sessions WHERE user_id=?",
                               (user_id,)).fetchone()
    return {"configured": bool(TRAKT_CLIENT_ID and TRAKT_CLIENT_SECRET), "connected": bool(account),
            "expires_at": account["expires_at"] if account else 0,
            "pending": dict(pending) if pending and pending["expires_at"] > int(time.time()) else None}


@app.post("/api/v1/trakt/device/start")
def trakt_device_start(user_id: int = Depends(current_user)):
    if not TRAKT_CLIENT_ID or not TRAKT_CLIENT_SECRET:
        raise HTTPException(503, "服务器尚未配置 Trakt Client ID 和 Client Secret")
    status, payload = json_request("POST", TRAKT_API_BASE + "/oauth/device/code",
                                   payload={"client_id": TRAKT_CLIENT_ID})
    if status != 200:
        raise HTTPException(502, f"无法向 Trakt 申请设备码（HTTP {status}）")
    now = int(time.time())
    expires_at = now + int(payload.get("expires_in") or 600)
    interval = max(5, int(payload.get("interval") or 5))
    with db() as conn:
        conn.execute("""INSERT INTO trakt_device_sessions(user_id,device_code,user_code,verification_url,
          expires_at,interval_seconds,next_poll_at,created_at) VALUES(?,?,?,?,?,?,?,?)
          ON CONFLICT(user_id) DO UPDATE SET device_code=excluded.device_code,user_code=excluded.user_code,
          verification_url=excluded.verification_url,expires_at=excluded.expires_at,
          interval_seconds=excluded.interval_seconds,next_poll_at=excluded.next_poll_at,created_at=excluded.created_at""",
          (user_id, payload["device_code"], payload["user_code"], payload.get("verification_url", "https://trakt.tv/activate"),
           expires_at, interval, now, now))
    return {"user_code": payload["user_code"], "verification_url": payload.get("verification_url", "https://trakt.tv/activate"),
            "expires_at": expires_at, "interval": interval}


@app.post("/api/v1/trakt/device/poll")
def trakt_device_poll(user_id: int = Depends(current_user)):
    now = int(time.time())
    with db() as conn:
        session = conn.execute("SELECT * FROM trakt_device_sessions WHERE user_id=?", (user_id,)).fetchone()
    if not session or session["expires_at"] <= now:
        raise HTTPException(410, "Trakt 设备码已过期，请重新申请")
    if session["next_poll_at"] > now:
        return {"connected": False, "pending": True, "retry_after": session["next_poll_at"] - now}
    status, payload = json_request("POST", TRAKT_API_BASE + "/oauth/device/token", payload={
        "code": session["device_code"], "client_id": TRAKT_CLIENT_ID, "client_secret": TRAKT_CLIENT_SECRET,
    })
    if status == 200:
        save_trakt_account(user_id, payload)
        with db() as conn:
            conn.execute("DELETE FROM trakt_device_sessions WHERE user_id=?", (user_id,))
        return {"connected": True, "pending": False}
    if status == 400:
        with db() as conn:
            conn.execute("UPDATE trakt_device_sessions SET next_poll_at=? WHERE user_id=?",
                         (now + session["interval_seconds"], user_id))
        return {"connected": False, "pending": True, "retry_after": session["interval_seconds"]}
    if status == 429:
        delay = session["interval_seconds"] + 5
        with db() as conn:
            conn.execute("UPDATE trakt_device_sessions SET interval_seconds=?,next_poll_at=? WHERE user_id=?",
                         (delay, now + delay, user_id))
        return {"connected": False, "pending": True, "retry_after": delay}
    if status in (404, 409, 410, 418):
        with db() as conn:
            conn.execute("DELETE FROM trakt_device_sessions WHERE user_id=?", (user_id,))
        raise HTTPException(status, "Trakt 授权失败或已失效")
    raise HTTPException(502, f"Trakt 授权检查失败（HTTP {status}）")


@app.delete("/api/v1/trakt/account")
def trakt_disconnect(user_id: int = Depends(current_user)):
    with db() as conn:
        conn.execute("DELETE FROM trakt_accounts WHERE user_id=?", (user_id,))
        conn.execute("DELETE FROM trakt_device_sessions WHERE user_id=?", (user_id,))
        conn.execute("DELETE FROM trakt_scrobble_state WHERE user_id=?", (user_id,))
    return {"connected": False}


@app.get("/api/v1/neodb/status")
def neodb_status(user_id: int = Depends(current_user)):
    with db() as conn:
        account = conn.execute("SELECT display_name,profile_url,updated_at FROM neodb_accounts WHERE user_id=?",
                               (user_id,)).fetchone()
    return {"configured": bool(NEODB_CLIENT_ID and NEODB_CLIENT_SECRET), "connected": bool(account),
            "instance": NEODB_API_BASE, "account": dict(account) if account else None}


@app.post("/api/v1/neodb/oauth/start")
def neodb_oauth_start(user_id: int = Depends(current_user)):
    if not NEODB_CLIENT_ID or not NEODB_CLIENT_SECRET:
        raise HTTPException(503, "服务器尚未配置 NeoDB Client ID 和 Client Secret")
    query = urllib.parse.urlencode({
        "response_type": "code", "client_id": NEODB_CLIENT_ID,
        "redirect_uri": NEODB_REDIRECT_URI, "scope": "read write",
    })
    return {"authorization_url": NEODB_API_BASE + "/oauth/authorize?" + query,
            "redirect_uri": NEODB_REDIRECT_URI, "manual_code": NEODB_REDIRECT_URI == "urn:ietf:wg:oauth:2.0:oob"}


@app.post("/api/v1/neodb/oauth/complete")
def neodb_oauth_complete(body: NeoDBAuthCode, user_id: int = Depends(current_user)):
    status, payload = form_request("POST", NEODB_API_BASE + "/oauth/token", {
        "client_id": NEODB_CLIENT_ID, "client_secret": NEODB_CLIENT_SECRET,
        "code": body.code.strip(), "redirect_uri": NEODB_REDIRECT_URI,
        "grant_type": "authorization_code",
    })
    if status != 200 or not payload.get("access_token"):
        raise HTTPException(400, "NeoDB 授权码无效或已过期")
    token = payload["access_token"]
    profile_status, profile = json_request("GET", NEODB_API_BASE + "/api/me", headers=neodb_headers(token))
    if profile_status != 200:
        raise HTTPException(502, "NeoDB 账号验证失败")
    now = int(time.time())
    with db() as conn:
        conn.execute("""INSERT INTO neodb_accounts(user_id,access_token,display_name,profile_url,created_at,updated_at)
          VALUES(?,?,?,?,?,?) ON CONFLICT(user_id) DO UPDATE SET access_token=excluded.access_token,
          display_name=excluded.display_name,profile_url=excluded.profile_url,updated_at=excluded.updated_at""",
          (user_id, seal_secret(token), profile.get("display_name") or profile.get("external_acct") or "NeoDB",
           profile.get("url") or "", now, now))
    return {"connected": True, "display_name": profile.get("display_name") or profile.get("external_acct") or "NeoDB"}


@app.delete("/api/v1/neodb/account")
def neodb_disconnect(user_id: int = Depends(current_user)):
    with db() as conn:
        conn.execute("DELETE FROM neodb_accounts WHERE user_id=?", (user_id,))
        conn.execute("DELETE FROM neodb_sync_state WHERE user_id=?", (user_id,))
    return {"connected": False}


@app.post("/api/v1/playback/event")
def playback_event(body: PlaybackEvent, user_id: int = Depends(current_user)):
    progress = min(100.0, max(0.0, body.position_ms * 100.0 / body.duration_ms))
    # 客户端多数影视源只有中文片名、无 tmdb/imdb ID，Trakt 无法用中文名匹配 → 观看记录传不上去。
    # 服务端反查一次 TMDB ID（带缓存）注入 ids，Trakt 即可按 tmdb 精确匹配。
    resolved_tmdb = body.tmdb_id or resolve_tmdb_id_by_title(body.title, body.year, body.media_type)
    ids = {key: value for key, value in (("imdb", body.imdb_id), ("tmdb", resolved_tmdb)) if value}
    if body.media_type == "movie":
        media = {"movie": {"title": body.title, "year": body.year, "ids": ids}}
        media_key = f"movie:{body.tmdb_id or body.imdb_id or body.title + ':' + str(body.year)}"
    else:
        media = {"show": {"title": body.title, "year": body.year, "ids": ids},
                 "episode": {"season": body.season, "number": body.episode}}
        media_key = f"episode:{body.tmdb_id or body.imdb_id or body.title}:{body.season}:{body.episode}"
    now = int(time.time())
    integrations = {}
    with db() as conn:
        trakt_account = conn.execute("SELECT 1 FROM trakt_accounts WHERE user_id=?", (user_id,)).fetchone()
        neodb_account = conn.execute("SELECT 1 FROM neodb_accounts WHERE user_id=?", (user_id,)).fetchone()
        old = conn.execute("SELECT * FROM trakt_scrobble_state WHERE user_id=? AND media_key=?",
                           (user_id, media_key)).fetchone()
    trakt_action = "start" if body.event == "progress" else body.event
    if TRAKT_CLIENT_ID and TRAKT_CLIENT_SECRET and trakt_account:
        if old and trakt_action == old["action"] and now - old["reported_at"] < 10 and abs(progress - old["progress"]) < .25:
            integrations["trakt"] = {"reported": False, "deduplicated": True}
        else:
            try:
                token = trakt_access_token(user_id)
                status, result = json_request("POST", TRAKT_API_BASE + "/scrobble/" + trakt_action,
                                              headers=trakt_headers(token), payload={**media,
                                              "progress": round(progress, 2), "app_version": APP_VERSION,
                                              "app_date": time.strftime("%Y-%m-%d")})
                if not 200 <= status < 300:
                    raise HTTPException(502, f"Trakt 播放状态上报失败（HTTP {status}）")
                with db() as conn:
                    conn.execute("""INSERT INTO trakt_scrobble_state(user_id,media_key,action,progress,reported_at)
                      VALUES(?,?,?,?,?) ON CONFLICT(user_id,media_key) DO UPDATE SET action=excluded.action,
                      progress=excluded.progress,reported_at=excluded.reported_at""",
                      (user_id, media_key, trakt_action, progress, now))
                integrations["trakt"] = {"reported": True, "result": result}
            except HTTPException as exc:
                integrations["trakt"] = {"reported": False, "error": str(exc.detail)}
    else:
        integrations["trakt"] = {"reported": False, "reason": "not_connected"}
    if NEODB_CLIENT_ID and NEODB_CLIENT_SECRET and neodb_account:
        try:
            integrations["neodb"] = report_neodb_playback(body, user_id, progress)
        except HTTPException as exc:
            integrations["neodb"] = {"reported": False, "error": str(exc.detail)}
    else:
        integrations["neodb"] = {"reported": False, "reason": "not_connected"}
    try:
        integrations["emby"] = report_emby_playback(body, user_id)
    except HTTPException as exc:
        integrations["emby"] = {"reported": False, "error": str(exc.detail)}
    logger.info("playback event=%s type=%s title=%s tmdb=%s -> trakt=%s neodb=%s",
                body.event, body.media_type, body.title, resolved_tmdb,
                integrations.get("trakt"), integrations.get("neodb"))
    return {"reported": any(x.get("reported") for x in integrations.values()),
            "progress": round(progress, 2), "integrations": integrations}


@app.get("/api/v1/meta/image/{size}/{filename}")
def get_meta_image(size: str, filename: str):
    if not re.fullmatch(r"(w\d{2,4}|original)", size) or not re.fullmatch(r"[A-Za-z0-9._-]{1,120}", filename):
        raise HTTPException(404, "图片不存在")
    url = TMDB_IMAGE_BASE + size + "/" + filename
    try:
        upstream = pool_for(url).request("GET", url)
    except Exception:
        raise HTTPException(502, "TMDB 图片暂时不可用")
    if upstream.status != 200:
        raise HTTPException(404, "图片不存在")
    return Response(content=upstream.data, media_type=upstream.headers.get("Content-Type", "image/jpeg"),
                    headers={"Cache-Control": "public, max-age=604800"})


@app.get("/api/v1/meta/title")
def title_metadata(request: Request, name: str = Query(min_length=1, max_length=300),
                   year: int = Query(default=0, ge=0, le=3000),
                   season: int = Query(default=1, ge=0, le=100),
                   media_type: str = Query(default="", pattern=r"^(|movie|tv)$"),
                   user_id: int = Depends(current_user)):
    cache_key = "title:" + hashlib.sha256(
        f"{name.strip().lower()}|{year}|{season}|{media_type}|{TMDB_LANGUAGE}|match-v5".encode()
    ).hexdigest()
    cached, expires = cached_json(cache_key)
    if cached is None:
        legacy_key = "title:" + hashlib.sha256(
            f"{name.strip().lower()}|{year}|{season}|{media_type}|{TMDB_LANGUAGE}|match-v4".encode()
        ).hexdigest()
        cached, _ = cached_json(legacy_key)
        expires = 0  # Refresh old partial results, while retaining an offline fallback.
    if cached is not None and expires and expires > int(time.time()):
        return rewrite_meta_images(cached | {"cached": True}, request)
    try:
        candidates, seen_candidates = [], set()
        search_path = "/3/search/" + media_type if media_type else "/3/search/multi"
        for query_name in title_match_variants(name)[:3]:
            search = tmdb_request(search_path, {"query": query_name, "language": TMDB_LANGUAGE,
                                                "include_adult": "false"})
            for item in search.get("results", []):
                normalized = dict(item)
                if media_type:
                    normalized["media_type"] = media_type
                if normalized.get("media_type") not in ("movie", "tv"):
                    continue
                key = (normalized.get("media_type"), normalized.get("id"))
                if key in seen_candidates:
                    continue
                seen_candidates.add(key)
                candidates.append(normalized)
            if pick_title_result(candidates, name, year, media_type):
                break
        match = pick_title_result(candidates, name, year, media_type)
        if not match:
            raise HTTPException(404, "未在 TMDB 找到匹配影片")
        media = match["media_type"]
        details = tmdb_request(f"/3/{media}/{match['id']}", {
            "language": TMDB_LANGUAGE, "append_to_response": "credits,recommendations,similar"
        })
        if not (details.get("overview") or "").strip() and TMDB_LANGUAGE.lower() != "en-us":
            try:
                english_details = tmdb_request(f"/3/{media}/{match['id']}", {"language": "en-US"})
                details["overview"] = english_details.get("overview") or ""
            except HTTPException:
                pass
        credits = details.get("credits", {})
        people = []
        seen = set()
        for person in credits.get("cast", [])[:24]:
            pid = person.get("id")
            if not pid or pid in seen:
                continue
            seen.add(pid)
            people.append({"id": pid, "name": person.get("name", ""),
                           "role": person.get("character", ""), "department": "演员",
                           "profile_url": image_url(person.get("profile_path"))})
        for person in credits.get("crew", []):
            if person.get("job") != "Director" or person.get("id") in seen:
                continue
            seen.add(person.get("id"))
            people.append({"id": person.get("id"), "name": person.get("name", ""),
                           "role": "导演", "department": "导演",
                           "profile_url": image_url(person.get("profile_path"))})
        organizations = []
        seen_organizations = set()
        for kind, label, values in (
                ("company", "制作公司", details.get("production_companies") or []),
                ("network", "电视台 / 播出平台", details.get("networks") or [])):
            for entity in values:
                entity_id = int(entity.get("id") or 0)
                entity_name = (entity.get("name") or "").strip()
                key = (kind, entity_id)
                if not entity_id or not entity_name or key in seen_organizations:
                    continue
                seen_organizations.add(key)
                organizations.append({"id": entity_id, "kind": kind, "label": label,
                                      "name": entity_name,
                                      "origin_country": entity.get("origin_country") or "",
                                      "logo_url": image_url(entity.get("logo_path"), "w342")})
        recommendation_candidates = []
        recommended_ids = set()
        current_genres = {int(item.get("id") or 0) for item in details.get("genres") or []}
        current_language = details.get("original_language") or ""
        current_countries = {str(value).upper() for value in details.get("origin_country") or [] if value}
        current_countries.update(
            str(item.get("iso_3166_1") or "").upper()
            for item in details.get("production_countries") or [] if item.get("iso_3166_1")
        )
        for group in ("recommendations", "similar"):
            for entry in (details.get(group) or {}).get("results", []):
                item_id = entry.get("id")
                if not item_id or item_id == details.get("id") or item_id in recommended_ids:
                    continue
                recommended_ids.add(item_id)
                normalized = dict(entry)
                normalized["media_type"] = normalized.get("media_type") or media
                work = compact_work(normalized)
                if work["title"]:
                    candidate_genres = {int(value or 0) for value in normalized.get("genre_ids") or []}
                    shared_genres = len(current_genres & candidate_genres)
                    same_language = bool(current_language and normalized.get("original_language") == current_language)
                    same_media = normalized.get("media_type") == media
                    candidate_countries = {
                        str(value).upper() for value in normalized.get("origin_country") or [] if value
                    }
                    same_country = bool(current_countries and candidate_countries
                                        and current_countries & candidate_countries)
                    country_score = (80 if same_country else
                                     (-48 if current_countries and candidate_countries else 0))
                    language_score = (46 if same_language else
                                      (-28 if current_language and normalized.get("original_language") else 0))
                    relevance = (shared_genres * 30 + country_score + language_score
                                 + (24 if same_media else -30)
                                 + (16 if group == "recommendations" else 8)
                                 + min(float(normalized.get("vote_average") or 0), 10)
                                 + min(float(normalized.get("popularity") or 0), 20) * 0.20)
                    if current_genres and candidate_genres and not shared_genres:
                        relevance -= 24
                    recommendation_candidates.append((relevance, work))
        recommendation_candidates.sort(key=lambda value: value[0], reverse=True)
        recommendations = [work for _, work in recommendation_candidates[:20]]
        episodes = []
        partial = False
        if media == "tv":
            try:
                season_data = tmdb_request(f"/3/tv/{match['id']}/season/{season}",
                                           {"language": TMDB_LANGUAGE})
                raw_episodes = season_data.get("episodes") or []
                english = {}
                if any(not (item.get("name") or "").strip() for item in raw_episodes):
                    try:
                        fallback = tmdb_request(f"/3/tv/{match['id']}/season/{season}",
                                                {"language": "en-US"})
                        english = {int(item.get("episode_number") or 0): item
                                   for item in fallback.get("episodes") or []}
                    except HTTPException:
                        partial = True
                for item in raw_episodes:
                    number = int(item.get("episode_number") or 0)
                    fallback_item = english.get(number, {})
                    episodes.append({
                        "number": number,
                        "title": item.get("name") or fallback_item.get("name") or "",
                        "overview": item.get("overview") or fallback_item.get("overview") or "",
                        "air_date": item.get("air_date") or fallback_item.get("air_date") or "",
                        "still_url": image_url(item.get("still_path") or fallback_item.get("still_path"), "w780"),
                    })
            except HTTPException:
                # Preserve previously fetched episodes during temporary upstream failures.
                episodes = (cached or {}).get("episodes") or []
                partial = True
        payload = {"tmdb_id": details.get("id"), "media_type": media,
                   "match_confidence": min(100, round(title_result_score(match, name, year, media_type) / 3.5)),
                   "title": details.get("title") or details.get("name") or name,
                   "overview": details.get("overview", ""),
                   "backdrop_url": image_url(details.get("backdrop_path"), "w1280"),
                   "people": people, "organizations": organizations,
                   "recommendations": recommendations, "episodes": episodes, "partial": partial}
        if partial:
            save_cached_json_for(cache_key, payload, 60)
        else:
            save_cached_json(cache_key, payload)
        return rewrite_meta_images(payload | {"cached": False}, request)
    except HTTPException:
        if cached is not None:
            return rewrite_meta_images(cached | {"cached": True, "stale": True}, request)
        raise


@app.get("/api/v1/meta/person/search")
def search_person_metadata(request: Request,
                           name: str = Query(min_length=1, max_length=120),
                           user_id: int = Depends(current_user)):
    try:
        result = tmdb_request("/3/search/person", {
            "query": name.strip(), "language": TMDB_LANGUAGE,
            "include_adult": "false"
        })
        people = []
        for item in result.get("results") or []:
            if not item.get("id") or not (item.get("name") or "").strip():
                continue
            people.append({
                "id": item.get("id"),
                "name": item.get("name") or "",
                "role": "",
                "department": item.get("known_for_department") or "",
                "profile_url": image_url(item.get("profile_path"), "w342"),
            })
            if len(people) >= 12:
                break
        return rewrite_meta_images({"people": people}, request)
    except HTTPException:
        raise


@app.get("/api/v1/meta/organization/search")
def search_organization_metadata(request: Request,
                                 name: str = Query(min_length=1, max_length=120),
                                 user_id: int = Depends(current_user)):
    result = tmdb_request("/3/search/company", {"query": name.strip(), "page": "1"})
    organizations = []
    for item in result.get("results") or []:
        if not item.get("id") or not (item.get("name") or "").strip():
            continue
        organizations.append({
            "id": item.get("id"), "kind": "company", "label": "制作 / 发行公司",
            "name": item.get("name") or "", "origin_country": item.get("origin_country") or "",
            "logo_url": image_url(item.get("logo_path"), "w342")
        })
        if len(organizations) >= 12:
            break
    return rewrite_meta_images({"organizations": organizations}, request)


@app.get("/api/v1/meta/person/{person_id}")
def person_metadata(person_id: int, request: Request, user_id: int = Depends(current_user)):
    cache_key = f"person:{person_id}:{TMDB_LANGUAGE}"
    cached, expires = cached_json(cache_key)
    if cached is not None and expires and expires > int(time.time()):
        return rewrite_meta_images(cached | {"cached": True}, request)
    try:
        details = tmdb_request(f"/3/person/{person_id}", {
            "language": TMDB_LANGUAGE, "append_to_response": "combined_credits"
        })
        if not (details.get("biography") or "").strip() and TMDB_LANGUAGE.lower() != "en-us":
            try:
                english_details = tmdb_request(f"/3/person/{person_id}", {
                    "language": "en-US", "append_to_response": "combined_credits"
                })
                details["biography"] = english_details.get("biography") or ""
                details["place_of_birth"] = details.get("place_of_birth") or english_details.get("place_of_birth") or ""
            except HTTPException:
                pass
        credits = details.get("combined_credits", {})
        works = [compact_work(x) for x in credits.get("cast", []) + credits.get("crew", [])
                 if x.get("media_type") in ("movie", "tv")]
        unique = {}
        for work in works:
            key = f"{work['media_type']}:{work['id']}"
            if key not in unique or work["popularity"] > unique[key]["popularity"]:
                unique[key] = work
        works = sorted(unique.values(), key=lambda x: x["popularity"], reverse=True)[:120]
        payload = {"id": details.get("id"), "name": details.get("name", ""),
                   "biography": details.get("biography", ""), "birthday": details.get("birthday"),
                   "place_of_birth": details.get("place_of_birth", ""),
                   "profile_url": image_url(details.get("profile_path"), "w342"), "works": works}
        save_cached_json(cache_key, payload)
        return rewrite_meta_images(payload | {"cached": False}, request)
    except HTTPException:
        if cached is not None:
            return rewrite_meta_images(cached | {"cached": True, "stale": True}, request)
        raise


@app.get("/api/v1/meta/organization/{kind}/{organization_id}")
def organization_metadata(kind: str, organization_id: int, request: Request,
                          user_id: int = Depends(current_user)):
    if kind not in ("company", "network") or organization_id <= 0:
        raise HTTPException(404, "未知机构")
    cache_key = f"organization:{kind}:{organization_id}:{TMDB_LANGUAGE}:v1"
    cached, expires = cached_json(cache_key)
    if cached is not None and expires and expires > int(time.time()):
        return rewrite_meta_images(cached | {"cached": True}, request)
    try:
        details = tmdb_request(f"/3/{kind}/{organization_id}", {"language": TMDB_LANGUAGE})
        works = []
        discover_targets = (("movie", "with_companies"), ("tv", "with_companies")) \
            if kind == "company" else (("tv", "with_networks"),)
        for media, filter_name in discover_targets:
            result = tmdb_request(f"/3/discover/{media}", {
                filter_name: str(organization_id), "language": TMDB_LANGUAGE,
                "include_adult": "false", "sort_by": "popularity.desc", "page": "1"
            })
            for item in result.get("results") or []:
                normalized = dict(item)
                normalized["media_type"] = media
                work = compact_work(normalized)
                if work["id"] and work["title"]:
                    works.append(work)
        unique = {}
        for work in works:
            key = f"{work['media_type']}:{work['id']}"
            if key not in unique or float(work.get("popularity") or 0) > float(unique[key].get("popularity") or 0):
                unique[key] = work
        works = sorted(unique.values(), key=lambda value: float(value.get("popularity") or 0), reverse=True)[:80]
        country = details.get("origin_country") or ""
        headquarters = details.get("headquarters") or ""
        description = (details.get("description") or "").strip()
        if not description:
            if kind == "company":
                description = "通过 TMDB 制作公司编号精确关联其电影与剧集作品。"
            else:
                description = "通过 TMDB 电视台或播出平台编号精确关联其剧集作品。"
        payload = {"id": details.get("id") or organization_id, "kind": kind,
                   "name": details.get("name") or "", "description": description,
                   "headquarters": headquarters, "origin_country": country,
                   "logo_url": image_url(details.get("logo_path"), "w342"), "works": works}
        save_cached_json(cache_key, payload)
        return rewrite_meta_images(payload | {"cached": False}, request)
    except HTTPException:
        if cached is not None:
            return rewrite_meta_images(cached | {"cached": True, "stale": True}, request)
        raise


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
              episode_name,position_ms,duration_ms,client_updated_at,server_updated_at,deleted,device_id,data_json,
              progress_key,content_key,content_year,episode_key)
              VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
              ON CONFLICT(user_id,record_key) DO UPDATE SET
              video_name=excluded.video_name, episode_name=excluded.episode_name,
              position_ms=excluded.position_ms, duration_ms=excluded.duration_ms,
              client_updated_at=excluded.client_updated_at, server_updated_at=excluded.server_updated_at,
              deleted=excluded.deleted, device_id=excluded.device_id, data_json=excluded.data_json,
              progress_key=excluded.progress_key, content_key=excluded.content_key,
              content_year=excluded.content_year, episode_key=excluded.episode_key""",
              (user_id, key, item.source_key, item.video_id, item.video_name, item.episode_id,
               item.episode_name, item.position_ms, item.duration_ms, item.updated_at, now,
               int(item.deleted), body.device_id, item.data_json, item.progress_key,
               item.content_key, item.content_year, item.episode_key))
            conn.execute("INSERT INTO sync_changes(user_id,record_key,server_updated_at) VALUES(?,?,?)",
                         (user_id, key, now))
            accepted += 1
        conn.execute("""DELETE FROM records WHERE user_id=? AND record_key NOT IN
          (SELECT record_key FROM records WHERE user_id=? ORDER BY server_updated_at DESC LIMIT ?)""",
          (user_id, user_id, MAX_RECORDS))
        # A playback heartbeat supersedes the previous one for the same episode. Keep the
        # journal bounded by current records instead of by playback duration.
        conn.execute("""DELETE FROM sync_changes
          WHERE user_id=? AND (
            sequence NOT IN (
              SELECT MAX(sequence) FROM sync_changes WHERE user_id=? GROUP BY record_key
            ) OR NOT EXISTS (
              SELECT 1 FROM records r
              WHERE r.user_id=sync_changes.user_id AND r.record_key=sync_changes.record_key
            )
          )""", (user_id, user_id))
    logger.info("push user=%s device=%s received=%s accepted=%s", user_id, body.device_id, len(body.records), accepted)
    return {"accepted": accepted, "cursor": now}


@app.post("/api/v1/favorites/push")
def favorites_push(body: FavoritesPushBody, user_id: int = Depends(current_user)):
    accepted = 0
    now = int(time.time() * 1000)
    with db() as conn:
        for item in body.records:
            key = item.key()
            old = conn.execute("SELECT client_updated_at FROM favorites WHERE user_id=? AND fav_key=?",
                               (user_id, key)).fetchone()
            if old and old["client_updated_at"] >= item.updated_at:
                continue
            conn.execute("""INSERT INTO favorites(user_id,fav_key,source_key,video_id,name,pic,deleted,
              client_updated_at,server_updated_at,device_id) VALUES(?,?,?,?,?,?,?,?,?,?)
              ON CONFLICT(user_id,fav_key) DO UPDATE SET
              name=excluded.name, pic=excluded.pic, deleted=excluded.deleted,
              client_updated_at=excluded.client_updated_at, server_updated_at=excluded.server_updated_at,
              device_id=excluded.device_id""",
              (user_id, key, item.source_key, item.video_id, item.name, item.pic,
               int(item.deleted), item.updated_at, now, body.device_id))
            conn.execute("INSERT INTO favorite_changes(user_id,fav_key,server_updated_at) VALUES(?,?,?)",
                         (user_id, key, now))
            accepted += 1
    logger.info("favorites push user=%s device=%s received=%s accepted=%s",
                user_id, body.device_id, len(body.records), accepted)
    return {"accepted": accepted}


@app.get("/api/v1/favorites/pull")
def favorites_pull(after: int = Query(default=0, ge=0), limit: int = Query(default=500, ge=1, le=1000),
                   user_id: int = Depends(current_user)):
    with db() as conn:
        events = conn.execute("""SELECT c.sequence, f.source_key, f.video_id, f.name, f.pic,
          f.deleted, f.client_updated_at FROM favorite_changes c LEFT JOIN favorites f
            ON f.user_id=c.user_id AND f.fav_key=c.fav_key
          WHERE c.user_id=? AND c.sequence>? ORDER BY c.sequence LIMIT ?""",
          (user_id, after, limit)).fetchall()
    records = []
    for event in events:
        if event["source_key"] is None:
            continue
        record = dict(event)
        del record["sequence"]
        record["deleted"] = bool(record["deleted"])
        record["updated_at"] = record.pop("client_updated_at")
        records.append(record)
    cursor = max((event["sequence"] for event in events), default=after)
    return {"records": records, "cursor": cursor, "has_more": len(events) == limit}


MAX_SEARCH_HISTORY = 50


@app.post("/api/v1/search-history/push")
def search_history_push(body: SearchHistoryPushBody, user_id: int = Depends(current_user)):
    accepted = 0
    now = int(time.time() * 1000)
    with db() as conn:
        for item in body.records:
            key = item.key()
            old = conn.execute("SELECT client_updated_at FROM search_history WHERE user_id=? AND term_key=?",
                               (user_id, key)).fetchone()
            if old and old["client_updated_at"] >= item.updated_at:
                continue
            conn.execute("""INSERT INTO search_history(user_id,term_key,title,deleted,
              client_updated_at,server_updated_at,device_id) VALUES(?,?,?,?,?,?,?)
              ON CONFLICT(user_id,term_key) DO UPDATE SET
              title=excluded.title, deleted=excluded.deleted,
              client_updated_at=excluded.client_updated_at, server_updated_at=excluded.server_updated_at,
              device_id=excluded.device_id""",
              (user_id, key, item.title.strip(), int(item.deleted), item.updated_at, now, body.device_id))
            conn.execute("INSERT INTO search_history_changes(user_id,term_key,server_updated_at) VALUES(?,?,?)",
                         (user_id, key, now))
            accepted += 1
        # 只保留每个账号最近的若干词条；被挤掉的词条不再参与后续合并。
        conn.execute("""DELETE FROM search_history WHERE user_id=? AND term_key NOT IN
          (SELECT term_key FROM search_history WHERE user_id=? ORDER BY client_updated_at DESC LIMIT ?)""",
          (user_id, user_id, MAX_SEARCH_HISTORY))
    logger.info("search-history push user=%s device=%s received=%s accepted=%s",
                user_id, body.device_id, len(body.records), accepted)
    return {"accepted": accepted}


@app.get("/api/v1/search-history/pull")
def search_history_pull(after: int = Query(default=0, ge=0), limit: int = Query(default=500, ge=1, le=1000),
                        user_id: int = Depends(current_user)):
    with db() as conn:
        events = conn.execute("""SELECT c.sequence, h.title, h.deleted, h.client_updated_at
          FROM search_history_changes c LEFT JOIN search_history h
            ON h.user_id=c.user_id AND h.term_key=c.term_key
          WHERE c.user_id=? AND c.sequence>? ORDER BY c.sequence LIMIT ?""",
          (user_id, after, limit)).fetchall()
    records = []
    for event in events:
        if event["title"] is None:
            continue
        record = dict(event)
        del record["sequence"]
        record["deleted"] = bool(record["deleted"])
        record["updated_at"] = record.pop("client_updated_at")
        records.append(record)
    cursor = max((event["sequence"] for event in events), default=after)
    return {"records": records, "cursor": cursor, "has_more": len(events) == limit}


@app.get("/api/v1/sync/pull")
def pull(since: int = Query(default=0, ge=0), limit: int = Query(default=500, ge=1, le=1000),
         user_id: int = Depends(current_user)):
    with db() as conn:
        rows = conn.execute("""SELECT source_key,video_id,video_name,episode_id,episode_name,
          position_ms,duration_ms,client_updated_at,deleted,device_id,server_updated_at,data_json,progress_key,
          content_key,content_year,episode_key
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
        # Coalesce journals created by older servers. The page limit counts distinct records,
        # and the extra row lets us report has_more without a second query.
        events = conn.execute("""WITH latest AS (
            SELECT c.record_key,MAX(c.sequence) AS sequence
            FROM sync_changes c JOIN records current
              ON current.user_id=c.user_id AND current.record_key=c.record_key
            WHERE c.user_id=? AND c.sequence>?
            GROUP BY c.record_key ORDER BY sequence LIMIT ?
          )
          SELECT latest.sequence, r.source_key,r.video_id,r.video_name,r.episode_id,
          r.episode_name,r.position_ms,r.duration_ms,r.client_updated_at,r.deleted,r.device_id,
          r.server_updated_at,r.data_json,r.progress_key,r.content_key,r.content_year,r.episode_key
          FROM latest JOIN records r ON r.user_id=? AND r.record_key=latest.record_key
          ORDER BY latest.sequence""", (user_id, after, limit + 1, user_id)).fetchall()
    has_more = len(events) > limit
    events = events[:limit]
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
    return {"records": records, "cursor": cursor, "has_more": has_more}


from . import security
import sys
security.install(sys.modules[__name__])
