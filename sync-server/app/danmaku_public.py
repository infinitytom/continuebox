"""Read-only adapter for the documented public danmu.zxz.ee XML API."""
import hashlib
import re
import threading
import time
import urllib.parse
import xml.etree.ElementTree as ET

import urllib3

BASE = "https://danmu.zxz.ee/"
MAX_BYTES = 3 * 1024 * 1024
POOL = urllib3.PoolManager(timeout=urllib3.Timeout(total=7, connect=3, read=4), retries=False)
SLOTS = threading.BoundedSemaphore(4)
LOCKS = [threading.Lock() for _ in range(64)]
PLATFORMS = {"www.bilibili.com", "m.bilibili.com", "v.qq.com", "www.iqiyi.com",
             "www.mgtv.com", "v.youku.com"}


def normalize_id(value):
    value = value.strip()
    if re.fullmatch(r"[a-fA-F0-9]{32}", value):
        return value.lower()
    try:
        u = urllib.parse.urlsplit(value)
        if u.scheme not in ("http", "https") or u.hostname not in PLATFORMS or u.username or u.password or u.port:
            return ""
        # Only public content identifiers are forwarded; credentials and tracking
        # query parameters can never reach the public provider.
        if not re.fullmatch(r"/[a-zA-Z0-9_./~-]{1,300}", u.path):
            return ""
        params = [(k, v) for k, v in urllib.parse.parse_qsl(u.query)
                  if k in {"id", "vid", "aid", "cid", "p"} and re.fullmatch(r"[a-zA-Z0-9_-]{1,64}", v)]
        return urllib.parse.urlunsplit(("https", u.hostname, u.path, urllib.parse.urlencode(params), ""))
    except ValueError:
        return ""


def parse_xml(raw):
    if len(raw) > MAX_BYTES or re.search(br"<!\s*(DOCTYPE|ENTITY)", raw, re.I):
        raise ValueError("unsupported XML")
    root = ET.fromstring(raw)
    if root.tag != "i":
        raise ValueError("unexpected response")
    comments = []
    for item in root.iter("d"):
        fields = item.get("p", "").split(",")
        if len(fields) < 4:
            continue
        message = "".join(item.itertext()).strip()
        # The provider prepends a generated service announcement, not a viewer comment.
        if re.match(r"^有\d+条弹幕正在赶来", message):
            continue
        mode = "1" if fields[1] == "0" else fields[1]
        comments.append({"p": f"{fields[0]},{mode},{fields[3]},[zxz]", "m": message})
        if len(comments) >= 30000:
            break
    return comments


def fetch(source_id, main):
    source_id = normalize_id(source_id)
    if not source_id:
        return [], False, ""
    digest = hashlib.sha256(source_id.encode()).hexdigest()
    key = "zxz:comments:" + digest
    cached, expiry = main.cached_json(key)
    now = int(time.time())
    valid = isinstance(cached, dict) and isinstance(cached.get("comments"), list)
    if valid and expiry and expiry > now:
        return cached["comments"], True, ""
    stale = cached["comments"] if valid and now - cached.get("fetched_at", 0) < 7 * 86400 else []
    lock = LOCKS[int(digest[:4], 16) % len(LOCKS)]
    if not lock.acquire(blocking=False):
        return stale, bool(stale), "公共弹幕正在更新"
    acquired = False
    try:
        acquired = SLOTS.acquire(blocking=False)
        if not acquired:
            return stale, bool(stale), "公共弹幕服务繁忙"
        url = BASE + "?" + urllib.parse.urlencode({"type": "xml", "id": source_id})
        response = POOL.request("GET", url, headers={"User-Agent": "ContinueBox/0.27.1", "Accept": "application/xml"},
                                redirect=False, preload_content=False)
        try:
            if response.status != 200:
                raise ValueError("upstream unavailable")
            raw = response.read(MAX_BYTES + 1)
            comments = parse_xml(raw)
            # Reuse the central validation and deduplication before storing untrusted XML.
            safe = ET.fromstring(main.comments_xml({"comments": comments}))
            comments = [{"p": f"{p[0]},{p[1]},{p[3]},[zxz]", "m": d.text or ""}
                        for d in safe.findall("d") if len(p := d.get("p", "").split(",")) >= 4]
            main.save_cached_json_for(key, {"comments": comments, "fetched_at": now}, 21600 if comments else 60)
            return comments, False, ""
        finally:
            response.close()
            response.release_conn()
    except (urllib3.exceptions.HTTPError, ValueError, ET.ParseError, OSError):
        if not stale:
            main.save_cached_json_for(key, {"comments": [], "fetched_at": now}, 60)
        return stale, bool(stale), "公共弹幕暂时不可用"
    finally:
        if acquired:
            SLOTS.release()
        lock.release()
