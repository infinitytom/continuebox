"""Email verification, durable quotas and revocable device sessions."""
import hashlib
import hmac
import ipaddress
import json
import os
import re
import secrets
import smtplib
import ssl
import time
import threading
from datetime import datetime, timedelta, timezone
from email.message import EmailMessage
from pathlib import Path

from fastapi import Depends, HTTPException, Request
from fastapi.responses import HTMLResponse, JSONResponse, RedirectResponse
from pydantic import BaseModel, Field, field_validator
from starlette.concurrency import run_in_threadpool

M = None
DEFAULTS = {"register_daily": 20, "register_ip_daily": 3, "mail_daily": 100,
            "mail_ip_daily": 10, "mail_email_daily": 5, "login_15min": 10,
            "requests_minute": 300, "requests_global_minute": 2000, "auth_global_minute": 60,
            "danmaku_minute": 10, "danmaku_daily": 300}
_cleanup_lock = threading.Lock()
_next_cleanup = 0


def digest(value):
    return hmac.new(M.TOKEN_SECRET.encode(), value.encode(), hashlib.sha256).hexdigest()


def day():
    return datetime.now(timezone(timedelta(hours=8))).strftime("%Y-%m-%d")


def source_ip(request):
    # Forwarded headers are interpreted by uvicorn ONLY for explicitly trusted peers.
    # Never trust arbitrary X-Forwarded-For at application level.
    return request.client.host if request.client else "unknown"


def settings(conn):
    row = conn.execute("SELECT value FROM security_settings WHERE key='limits'").fetchone()
    return {**DEFAULTS, **(json.loads(row[0]) if row else {})}


def reserve(conn, key, bucket, limit, retry=60):
    row = conn.execute("SELECT count FROM security_quota WHERE key=? AND bucket=?", (key, bucket)).fetchone()
    if row and row[0] >= limit:
        raise HTTPException(429, "请求过于频繁，请稍后重试", headers={"Retry-After": str(retry)})
    conn.execute("""INSERT INTO security_quota(key,bucket,count,expires_at) VALUES(?,?,1,?)
        ON CONFLICT(key,bucket) DO UPDATE SET count=count+1""", (key, bucket, int(time.time()) + 172800))


def quota(items):
    with M.db() as conn:
        conn.execute("BEGIN IMMEDIATE")
        limits = settings(conn)
        for key, bucket, setting, retry in items:
            reserve(conn, key, bucket, limits[setting], retry)


def migrate():
    with M.db() as conn:
        cols = {row[1] for row in conn.execute("PRAGMA table_info(users)")}
        for name, declaration in (("email", "TEXT"), ("email_verified", "INTEGER NOT NULL DEFAULT 0"),
                                  ("legacy_revoked", "INTEGER NOT NULL DEFAULT 0")):
            if name not in cols:
                conn.execute(f"ALTER TABLE users ADD COLUMN {name} {declaration}")
        conn.executescript("""
        CREATE UNIQUE INDEX IF NOT EXISTS idx_users_email ON users(email COLLATE NOCASE) WHERE email IS NOT NULL;
        CREATE TABLE IF NOT EXISTS security_quota(key TEXT,bucket TEXT,count INTEGER,expires_at INTEGER,
            PRIMARY KEY(key,bucket));
        CREATE TABLE IF NOT EXISTS security_settings(key TEXT PRIMARY KEY,value TEXT NOT NULL);
        CREATE TABLE IF NOT EXISTS email_challenges(
            email TEXT,purpose TEXT,code_hash TEXT,nonce TEXT,expires_at INTEGER,
            attempts INTEGER NOT NULL DEFAULT 0,used INTEGER NOT NULL DEFAULT 0,PRIMARY KEY(email,purpose));
        CREATE TABLE IF NOT EXISTS device_sessions(
            id TEXT PRIMARY KEY,user_id INTEGER NOT NULL,device_id TEXT NOT NULL,device_name TEXT NOT NULL,
            created_at INTEGER NOT NULL,last_seen INTEGER NOT NULL,expires_at INTEGER NOT NULL,revoked INTEGER NOT NULL DEFAULT 0,
            FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE);
        CREATE TABLE IF NOT EXISTS security_audit(
            id INTEGER PRIMARY KEY AUTOINCREMENT,event TEXT NOT NULL,actor INTEGER,target INTEGER,created_at INTEGER NOT NULL);
        CREATE TABLE IF NOT EXISTS user_danmaku_links(
            user_id INTEGER NOT NULL,identity_key TEXT NOT NULL,episode_id INTEGER NOT NULL,title TEXT NOT NULL,
            PRIMARY KEY(user_id,identity_key),FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE);
        """)
        conn.execute("DELETE FROM security_quota WHERE expires_at<?", (int(time.time()),))
        conn.execute("DELETE FROM email_challenges WHERE expires_at<?", (int(time.time()) - 86400,))
        conn.execute("DELETE FROM device_sessions WHERE expires_at<?", (int(time.time()) - 86400,))
        conn.execute("DELETE FROM security_audit WHERE created_at<?", (int(time.time()) - 90 * 86400,))


def audit(conn, event, actor=None, target=None):
    conn.execute("INSERT INTO security_audit(event,actor,target,created_at) VALUES(?,?,?,?)",
                 (event, actor, target, int(time.time())))


def mail_ready():
    return bool(os.getenv("SMTP_HOST") and os.getenv("SMTP_USER") and os.getenv("SMTP_PASSWORD") and os.getenv("SMTP_FROM"))


def deliver(email, code, purpose):
    if not mail_ready():
        raise HTTPException(503, "邮箱验证服务尚未配置，请联系管理员")
    mode = os.getenv("SMTP_SECURITY", "ssl")
    if mode not in ("ssl", "starttls"):
        raise HTTPException(503, "发信服务必须使用 TLS")
    message = EmailMessage()
    message["From"] = os.environ["SMTP_FROM"]
    message["To"] = email
    message["Subject"] = "续映 · 邮箱验证码"
    message.set_content(f"你的续映验证码是：{code}\n\n10 分钟内有效。请勿向他人透露。\n如果不是你本人操作，请忽略此邮件。")
    smtp_type = smtplib.SMTP_SSL if mode == "ssl" else smtplib.SMTP
    kwargs = {"timeout": 15}
    if mode == "ssl":
        kwargs["context"] = ssl.create_default_context()
    try:
        with smtp_type(os.environ["SMTP_HOST"], int(os.getenv("SMTP_PORT", "465")), **kwargs) as smtp:
            if mode == "starttls":
                smtp.starttls(context=ssl.create_default_context())
            smtp.login(os.environ["SMTP_USER"], os.environ["SMTP_PASSWORD"])
            smtp.send_message(message)
    except Exception:
        # Never return or log SMTP responses, credentials or verification codes.
        raise HTTPException(503, "验证邮件暂时发送失败，请稍后重试")


class EmailInput(BaseModel):
    email: str = Field(max_length=254)

    @field_validator("email")
    @classmethod
    def normalize(cls, value):
        value = value.strip().lower()
        if not re.fullmatch(r"[a-z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-z0-9](?:[a-z0-9.-]*[a-z0-9])?\.[a-z]{2,63}", value):
            raise ValueError("请输入有效邮箱")
        return value


class CodeRequest(EmailInput):
    purpose: str = Field(default="register", pattern=r"^(register|bind|delete)$")


class Registration(EmailInput):
    username: str = Field(min_length=3, max_length=32, pattern=r"^[A-Za-z0-9_.-]+$")
    password: str = Field(min_length=12, max_length=128)
    code: str = Field(pattern=r"^[0-9]{6}$")
    device_id: str = Field(default="", max_length=128)
    device_name: str = Field(default="续映设备", max_length=80)


class Login(BaseModel):
    username: str = Field(min_length=3, max_length=254)
    password: str = Field(min_length=8, max_length=128)
    device_id: str = Field(default="", max_length=128)
    device_name: str = Field(default="续映设备", max_length=80)


class Bind(EmailInput):
    code: str = Field(pattern=r"^[0-9]{6}$")
    password: str = Field(min_length=8, max_length=128)


class Removal(BaseModel):
    password: str = Field(min_length=8, max_length=128)
    code: str = Field(pattern=r"^[0-9]{6}$")
    confirmation: str


def check_code(conn, email, purpose, code):
    row = conn.execute("SELECT code_hash,nonce,expires_at,attempts,used FROM email_challenges WHERE email=? AND purpose=?",
                       (email, purpose)).fetchone()
    if not row or row[2] < time.time() or row[3] >= 5 or row[4]:
        raise HTTPException(400, "验证码已失效，请重新获取")
    if not hmac.compare_digest(row[0], digest(row[1] + ":" + email + ":" + purpose + ":" + code)):
        conn.execute("UPDATE email_challenges SET attempts=attempts+1 WHERE email=? AND purpose=?", (email, purpose))
        conn.commit()  # Wrong attempts MUST survive the rejected transaction.
        raise HTTPException(400, "验证码错误")
    conn.execute("UPDATE email_challenges SET used=1 WHERE email=? AND purpose=?", (email, purpose))


def issue(conn, uid, body):
    now = int(time.time())
    device = body.device_id or secrets.token_urlsafe(18)
    sid = secrets.token_urlsafe(32)
    conn.execute("UPDATE device_sessions SET revoked=1 WHERE user_id=? AND device_id=?", (uid, device))
    conn.execute("INSERT INTO device_sessions VALUES(?,?,?,?,?,?,?,0)",
                 (sid, uid, device, body.device_name, now, now, now + M.TOKEN_DAYS * 86400))
    payload = M.b64(json.dumps({"uid": uid, "sid": sid, "exp": now + M.TOKEN_DAYS * 86400}, separators=(",", ":")).encode())
    signature = M.b64(hmac.new(M.TOKEN_SECRET.encode(), payload.encode(), hashlib.sha256).digest())
    username = conn.execute("SELECT username FROM users WHERE id=?", (uid,)).fetchone()[0]
    return {"token": payload + "." + signature, "token_type": "bearer", "username": username, "session_id": sid}


def validate_session(conn, claims, uid):
    if "sid" not in claims:
        row = conn.execute("SELECT legacy_revoked FROM users WHERE id=?", (uid,)).fetchone()
        if not row or row[0]:
            raise ValueError("legacy session revoked")
        return
    row = conn.execute("SELECT revoked,expires_at,last_seen FROM device_sessions WHERE id=? AND user_id=?",
                       (claims["sid"], uid)).fetchone()
    if not row or row[0] or row[1] < time.time():
        raise ValueError("session revoked")
    if row[2] < time.time() - 300:
        conn.execute("UPDATE device_sessions SET last_seen=? WHERE id=?", (int(time.time()), claims["sid"]))


def session_id(request):
    try:
        return json.loads(M.unb64(request.headers["authorization"][7:].split(".")[0])).get("sid", "")
    except Exception:
        return ""


def install(main):
    global M
    M = main
    # Local deployment secrets never enter APKs or distributable update archives.
    config_file = M.DATA_DIR / "security.env"
    if config_file.exists():
        if os.name == "posix" and config_file.stat().st_mode & 0o077:
            raise RuntimeError("/data/security.env 权限必须为 600")
        allowed = {"SMTP_HOST", "SMTP_PORT", "SMTP_SECURITY", "SMTP_USER", "SMTP_PASSWORD", "SMTP_FROM", "ADMIN_USERNAMES"}
        for line in config_file.read_text(encoding="utf-8-sig").splitlines():
            if "=" in line and not line.lstrip().startswith("#"):
                key, value = line.split("=", 1)
                if key.strip() in allowed:
                    os.environ[key.strip()] = value.strip()
    app = M.app
    # Replace insecure legacy registration and public diagnostics.
    replaced = {"/api/v1/auth/register", "/api/v1/auth/login", "/api/v1/stats", "/dashboard"}
    app.router.routes[:] = [route for route in app.router.routes if getattr(route, "path", "") not in replaced]

    def administrator(uid=Depends(M.current_user)):
        with M.db() as conn:
            row = conn.execute("SELECT username FROM users WHERE id=?", (uid,)).fetchone()
        names = {x.strip().lower() for x in os.getenv("ADMIN_USERNAMES", "").split(",") if x.strip()}
        if not row or row[0].lower() not in names:
            raise HTTPException(403, "需要管理员权限")
        return uid

    def request_quota(request):
        global _next_cleanup
        now = int(time.time())
        if now >= _next_cleanup:
            with _cleanup_lock:
                if now >= _next_cleanup:
                    with M.db() as conn:
                        conn.execute("DELETE FROM security_quota WHERE expires_at<?", (now,))
                        conn.execute("DELETE FROM email_challenges WHERE expires_at<?", (now - 86400,))
                        conn.execute("DELETE FROM security_audit WHERE created_at<?", (now - 90 * 86400,))
                        conn.execute("DELETE FROM device_sessions WHERE expires_at<?", (now - 86400,))
                    _next_cleanup = now + 3600
        limits = [("request:" + digest(source_ip(request)), str(now // 60), "requests_minute", 60),
                  ("request:global", str(now // 60), "requests_global_minute", 60)]
        if request.url.path.startswith("/api/v1/auth/") and request.method == "POST":
            limits.append(("auth:global", str(now // 60), "auth_global_minute", 60))
        quota(limits)

    @app.middleware("http")
    async def protect(request, call_next):
        try:
            await run_in_threadpool(request_quota, request)
            length = request.headers.get("content-length", "")
            if length and (not length.isdigit() or int(length) > 4 * 1024 * 1024):
                return JSONResponse({"detail": "请求体过大"}, status_code=413)
            # Also cap chunked bodies; never buffer media responses.
            if request.method in ("POST", "PUT", "PATCH", "DELETE"):
                body = bytearray()
                async for chunk in request.stream():
                    body.extend(chunk)
                    if len(body) > 4 * 1024 * 1024:
                        return JSONResponse({"detail": "请求体过大"}, status_code=413)
                request._body = bytes(body)
            response = await call_next(request)
        except HTTPException as error:
            response = JSONResponse({"detail": error.detail}, status_code=error.status_code, headers=error.headers)
        response.headers["X-Content-Type-Options"] = "nosniff"
        response.headers["Referrer-Policy"] = "no-referrer"
        response.headers["X-Frame-Options"] = "DENY"
        if request.url.path == "/dashboard":
            page = (Path(__file__).parent / "dashboard.html").read_text(encoding="utf-8")
            script = re.search(r"<script>(.*?)</script>", page, re.S).group(1)
            style = re.search(r"<style>(.*?)</style>", page, re.S).group(1)
            import base64
            script_hash = base64.b64encode(hashlib.sha256(script.encode()).digest()).decode()
            style_hash = base64.b64encode(hashlib.sha256(style.encode()).digest()).decode()
            response.headers["Content-Security-Policy"] = (
                f"default-src 'none'; script-src 'sha256-{script_hash}'; style-src 'sha256-{style_hash}'; "
                "style-src-attr 'unsafe-inline'; connect-src 'self'; base-uri 'none'; form-action 'self'; frame-ancestors 'none'")
        if request.url.path.startswith(("/api/v1/auth", "/api/v1/account", "/api/v1/admin", "/dashboard")):
            response.headers["Cache-Control"] = "no-store"
        return response

    @app.get("/api/v1/auth/config")
    def configuration():
        return {"email_required": True, "mail_ready": mail_ready(), "register_enabled": M.ALLOW_REGISTER,
                "password_min_length": 12, "code_expires_seconds": 600}

    @app.post("/api/v1/auth/email-code")
    def email_code(body: CodeRequest, request: Request):
        if body.purpose == "register" and not M.ALLOW_REGISTER:
            raise HTTPException(403, "服务器已关闭注册")
        if body.purpose != "register":
            uid = M.current_user(request.headers.get("authorization"))
            if body.purpose == "delete":
                with M.db() as conn:
                    row = conn.execute("SELECT email,email_verified FROM users WHERE id=?", (uid,)).fetchone()
                if not row[1] or row[0] != body.email:
                    raise HTTPException(400, "请使用已绑定邮箱")
        if not mail_ready():
            raise HTTPException(503, "邮箱验证服务尚未配置，请联系管理员")
        ip = digest(source_ip(request))
        bucket = day()
        quota([("mail:global", bucket, "mail_daily", 3600),
               ("mail:ip:" + ip, bucket, "mail_ip_daily", 3600),
               ("mail:email:" + digest(body.email), bucket, "mail_email_daily", 3600)])
        now = int(time.time())
        code, nonce = f"{secrets.randbelow(1000000):06d}", secrets.token_hex(16)
        with M.db() as conn:
            conn.execute("BEGIN IMMEDIATE")
            previous = conn.execute("SELECT expires_at FROM email_challenges WHERE email=? AND purpose=?",
                                    (body.email, body.purpose)).fetchone()
            if previous and previous[0] - 600 > now - 60:
                raise HTTPException(429, "请等待 60 秒后重新发送", headers={"Retry-After": "60"})
            conn.execute("INSERT OR REPLACE INTO email_challenges VALUES(?,?,?,?,?,0,1)",
                         (body.email, body.purpose, digest(nonce + ":" + body.email + ":" + body.purpose + ":" + code), nonce, now + 600))
        deliver(body.email, code, body.purpose)
        with M.db() as conn:
            conn.execute("UPDATE email_challenges SET used=0 WHERE email=? AND purpose=? AND nonce=?",
                         (body.email, body.purpose, nonce))
        return {"sent": True, "expires_in": 600, "resend_after": 60}

    @app.post("/api/v1/auth/register", status_code=201)
    def register(body: Registration, request: Request):
        if not M.ALLOW_REGISTER:
            raise HTTPException(403, "服务器已关闭注册")
        quota([("register-attempt:" + digest(source_ip(request)), str(int(time.time()) // 900), "login_15min", 900)])
        if body.username.lower() in {x.strip().lower() for x in os.getenv("ADMIN_USERNAMES", "").split(",")}:
            raise HTTPException(409, "该账号名不可用于注册")
        hashed = M.password_hash(body.password)
        with M.db() as conn:
            conn.execute("BEGIN IMMEDIATE")
            check_code(conn, body.email, "register", body.code)
            limits = settings(conn)
            reserve(conn, "register:global", day(), limits["register_daily"], 3600)
            reserve(conn, "register:ip:" + digest(source_ip(request)), day(), limits["register_ip_daily"], 3600)
            if conn.execute("SELECT id FROM users WHERE username=? OR email=? COLLATE NOCASE",
                            (body.username, body.email)).fetchone():
                raise HTTPException(409, "账号或邮箱已被使用，请登录或更换")
            cur = conn.execute("INSERT INTO users(username,password_hash,created_at,email,email_verified) VALUES(?,?,?,?,1)",
                               (body.username, hashed, int(time.time() * 1000), body.email))
            audit(conn, "register", cur.lastrowid, cur.lastrowid)
            return issue(conn, cur.lastrowid, body)

    @app.post("/api/v1/auth/login")
    def login(body: Login, request: Request):
        bucket = str(int(time.time()) // 900)
        quota([("login:ip:" + digest(source_ip(request)), bucket, "login_15min", 900),
               ("login:user:" + digest(body.username.strip().lower()), bucket, "login_15min", 900)])
        with M.db() as conn:
            row = conn.execute("SELECT id,password_hash FROM users WHERE username=? OR email=? COLLATE NOCASE",
                               (body.username.strip(), body.username.strip().lower())).fetchone()
        if not row or not M.password_ok(body.password, row[1]):
            # Match scrypt work for nonexistent users.
            if not row:
                M.password_hash(body.password)
            raise HTTPException(401, "账号或密码错误")
        with M.db() as conn:
            audit(conn, "login", row[0], row[0])
            return issue(conn, row[0], body)

    @app.get("/api/v1/account/profile")
    def profile(uid=Depends(M.current_user)):
        with M.db() as conn:
            row = conn.execute("SELECT username,email,email_verified FROM users WHERE id=?", (uid,)).fetchone()
        return {"username": row[0], "email": row[1] or "", "email_verified": bool(row[2])}

    @app.post("/api/v1/account/email")
    def bind(body: Bind, request: Request, uid=Depends(M.current_user)):
        quota([("bind:" + str(uid), str(int(time.time()) // 900), "login_15min", 900)])
        with M.db() as conn:
            conn.execute("BEGIN IMMEDIATE")
            row = conn.execute("SELECT password_hash FROM users WHERE id=?", (uid,)).fetchone()
            if not M.password_ok(body.password, row[0]):
                raise HTTPException(401, "密码错误")
            check_code(conn, body.email, "bind", body.code)
            if conn.execute("SELECT id FROM users WHERE email=? COLLATE NOCASE AND id<>?", (body.email, uid)).fetchone():
                raise HTTPException(409, "该邮箱已被使用")
            conn.execute("UPDATE users SET email=?,email_verified=1 WHERE id=?", (body.email, uid))
            audit(conn, "bind_email", uid, uid)
        return {"bound": True}

    @app.get("/api/v1/account/devices")
    def devices(request: Request, uid=Depends(M.current_user)):
        with M.db() as conn:
            rows = conn.execute("""SELECT id,device_name,created_at,last_seen FROM device_sessions
                WHERE user_id=? AND revoked=0 AND expires_at>? ORDER BY last_seen DESC""", (uid, int(time.time()))).fetchall()
            legacy = not conn.execute("SELECT legacy_revoked FROM users WHERE id=?", (uid,)).fetchone()[0]
        return {"devices": [{"id": r[0], "name": r[1], "created_at": r[2], "last_seen": r[3],
                              "current": r[0] == session_id(request)} for r in rows], "legacy_sessions_possible": legacy}

    @app.delete("/api/v1/account/devices/{sid}")
    def revoke(sid: str, uid=Depends(M.current_user)):
        with M.db() as conn:
            changed = conn.execute("UPDATE device_sessions SET revoked=1 WHERE id=? AND user_id=?", (sid, uid))
            if not changed.rowcount:
                raise HTTPException(404, "设备不存在")
            audit(conn, "revoke_device", uid, uid)
        return {"revoked": True}

    @app.post("/api/v1/account/logout")
    def logout(request: Request, uid=Depends(M.current_user)):
        sid = session_id(request)
        with M.db() as conn:
            if sid:
                conn.execute("UPDATE device_sessions SET revoked=1 WHERE id=? AND user_id=?", (sid, uid))
            else:
                conn.execute("UPDATE users SET legacy_revoked=1 WHERE id=?", (uid,))
            audit(conn, "logout", uid, uid)
        return {"logged_out": True}

    @app.post("/api/v1/account/logout-all")
    def logout_all(uid=Depends(M.current_user)):
        with M.db() as conn:
            conn.execute("UPDATE device_sessions SET revoked=1 WHERE user_id=?", (uid,))
            conn.execute("UPDATE users SET legacy_revoked=1 WHERE id=?", (uid,))
            audit(conn, "logout_all", uid, uid)
        return {"logged_out": True}

    @app.delete("/api/v1/account")
    def remove(body: Removal, uid=Depends(M.current_user)):
        quota([("delete:" + str(uid), str(int(time.time()) // 900), "login_15min", 900)])
        with M.db() as conn:
            conn.execute("BEGIN IMMEDIATE")
            row = conn.execute("SELECT username,password_hash,email,email_verified FROM users WHERE id=?", (uid,)).fetchone()
            if body.confirmation != row[0] or not M.password_ok(body.password, row[1]):
                raise HTTPException(400, "账号名或密码不正确")
            if not row[3]:
                raise HTTPException(400, "请先绑定邮箱")
            check_code(conn, row[2], "delete", body.code)
            conn.execute("DELETE FROM users WHERE id=?", (uid,))
            audit(conn, "delete_account", uid, uid)
        return {"deleted": True}

    @app.get("/api/v1/stats")
    def stats(uid=Depends(administrator)):
        return M.server_stats()

    @app.get("/api/v1/admin/overview")
    def overview(uid=Depends(administrator)):
        with M.db() as conn:
            limits = settings(conn)
            counts = {r[0]: r[1] for r in conn.execute("SELECT key,count FROM security_quota WHERE bucket=? AND key IN ('register:global','mail:global')", (day(),))}
            events = [dict(zip(("event", "actor", "target", "created_at"), r)) for r in
                      conn.execute("SELECT event,actor,target,created_at FROM security_audit ORDER BY id DESC LIMIT 30")]
            active = conn.execute("SELECT count(*) FROM device_sessions WHERE revoked=0 AND expires_at>?",
                                  (int(time.time()),)).fetchone()[0]
        return {"stats": M.server_stats(), "limits": limits, "today_registered": counts.get("register:global", 0),
                "today_mail": counts.get("mail:global", 0), "mail_ready": mail_ready(), "events": events, "active_devices": active}

    @app.get("/api/v1/admin/users")
    def users(offset: int = 0, uid=Depends(administrator)):
        with M.db() as conn:
            rows = conn.execute("""SELECT id,username,email,email_verified,created_at,
                (SELECT count(*) FROM device_sessions d WHERE d.user_id=users.id AND d.revoked=0 AND d.expires_at>?)
                FROM users ORDER BY id DESC LIMIT 100 OFFSET ?""", (int(time.time()), max(0, offset))).fetchall()
        return {"users": [dict(zip(("id", "username", "email", "email_verified", "created_at", "devices"), r)) for r in rows]}

    @app.put("/api/v1/admin/limits")
    def limits(body: dict[str, int], uid=Depends(administrator)):
        if set(body) != set(DEFAULTS) or any(type(v) is not int or v < 1 or v > 10000 for v in body.values()):
            raise HTTPException(400, "额度必须为 1～10000 的整数，并包含所有配置项")
        with M.db() as conn:
            conn.execute("INSERT OR REPLACE INTO security_settings VALUES('limits',?)", (json.dumps(body),))
            audit(conn, "update_limits", uid)
        return {"saved": True}

    @app.post("/api/v1/admin/users/{target}/logout-all")
    def admin_logout(target: int, uid=Depends(administrator)):
        with M.db() as conn:
            conn.execute("UPDATE device_sessions SET revoked=1 WHERE user_id=?", (target,))
            conn.execute("UPDATE users SET legacy_revoked=1 WHERE id=?", (target,))
            audit(conn, "admin_logout_all", uid, target)
        return {"revoked": True}

    @app.get("/api/v1/admin/users/{target}/devices")
    def admin_devices(target: int, uid=Depends(administrator)):
        with M.db() as conn:
            rows = conn.execute("""SELECT id,device_name,last_seen FROM device_sessions
                WHERE user_id=? AND revoked=0 AND expires_at>? ORDER BY last_seen DESC""", (target, int(time.time()))).fetchall()
        return {"devices": [dict(zip(("id", "name", "last_seen"), r)) for r in rows]}

    @app.delete("/api/v1/admin/users/{target}/devices/{sid}")
    def admin_revoke_device(target: int, sid: str, uid=Depends(administrator)):
        with M.db() as conn:
            result = conn.execute("UPDATE device_sessions SET revoked=1 WHERE user_id=? AND id=?", (target, sid))
            if not result.rowcount:
                raise HTTPException(404, "设备不存在")
            audit(conn, "admin_revoke_device", uid, target)
        return {"revoked": True}

    @app.get("/api/v1/admin/danmaku")
    def moderation(offset: int = 0, uid=Depends(administrator)):
        with M.db() as conn:
            rows = conn.execute("""SELECT d.id,u.username,d.text,d.time_ms,d.created_at,d.sent_upstream
                FROM local_danmaku d JOIN users u ON u.id=d.user_id ORDER BY d.id DESC LIMIT 100 OFFSET ?""",
                (max(0, offset),)).fetchall()
        return {"comments": [dict(zip(("id", "username", "text", "time_ms", "created_at", "sent_upstream"), r)) for r in rows]}

    @app.delete("/api/v1/admin/danmaku/{comment_id}")
    def moderate_delete(comment_id: int, uid=Depends(administrator)):
        with M.db() as conn:
            result = conn.execute("DELETE FROM local_danmaku WHERE id=?", (comment_id,))
            if not result.rowcount:
                raise HTTPException(404, "弹幕不存在")
            audit(conn, "delete_local_danmaku", uid, comment_id)
        return {"deleted": True, "scope": "local_only"}

    @app.get("/dashboard", response_class=HTMLResponse)
    def dashboard():
        return (Path(__file__).parent / "dashboard.html").read_text(encoding="utf-8")

    @app.get("/", include_in_schema=False)
    def index():
        return RedirectResponse("/dashboard", status_code=307)
