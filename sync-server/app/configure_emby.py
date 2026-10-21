import getpass
import sys
import time
import urllib.parse

from app import main


def required(prompt: str, secret: bool = False) -> str:
    value = (getpass.getpass(prompt) if secret else input(prompt)).strip()
    if not value:
        raise ValueError("输入不能为空")
    return value


def choose(title: str, items: list[dict], label_key: str) -> dict:
    if not items:
        raise ValueError(title + "为空")
    print("\n" + title)
    for index, item in enumerate(items, 1):
        suffix = "（管理员）" if (item.get("Policy") or {}).get("IsAdministrator") else ""
        print(f"  {index}. {item.get(label_key) or '未命名'}{suffix}")
    while True:
        raw = input(f"请选择 1-{len(items)}：").strip()
        if raw.isdigit() and 1 <= int(raw) <= len(items):
            return items[int(raw) - 1]
        print("选择无效，请重新输入。")


def validate_base_url(value: str) -> str:
    base_url = value.strip().rstrip("/")
    parsed = urllib.parse.urlparse(base_url)
    if parsed.scheme not in ("http", "https") or not parsed.netloc or parsed.username or parsed.password:
        raise ValueError("Emby 地址必须是无内嵌账号密码的 http/https 地址")
    return base_url


def api_key_headers(api_key: str) -> dict:
    return {
        "X-Emby-Token": api_key,
        "X-Emby-Authorization": (
            f'MediaBrowser Client="ContinueBox Setup", Device="FNOS", '
            f'DeviceId="continuebox-setup", Version="{main.APP_VERSION}"'
        ),
    }


def fetch_emby_users(base_url: str, api_key: str) -> tuple[list[dict], str]:
    headers = api_key_headers(api_key)
    query = urllib.parse.urlencode({"IsDisabled": "false", "Limit": "100", "SortOrder": "Ascending"})
    status, payload = main.json_request("GET", base_url + "/Users/Query?" + query, headers=headers)
    if status in (401, 403):
        raise ValueError("API 密钥无效或没有读取用户列表的权限")
    if status != 200 or not isinstance(payload, dict):
        raise ValueError(f"无法读取 Emby 用户列表（HTTP {status}）")
    users = [user for user in payload.get("Items") or []
             if user.get("Id") and not (user.get("Policy") or {}).get("IsDisabled")]
    if not users:
        raise ValueError("Emby 没有可选择的启用用户")
    server_id = next((str(user.get("ServerId") or "") for user in users if user.get("ServerId")), "")
    return users, server_id


def verify_selected_user(base_url: str, api_key: str, emby_user_id: str):
    quoted = urllib.parse.quote(emby_user_id, safe="")
    status, _ = main.json_request(
        "GET", base_url + f"/Users/{quoted}/Views?IncludeExternalContent=true",
        headers=api_key_headers(api_key),
    )
    if status in (401, 403):
        raise ValueError("API 密钥不能代表所选用户读取媒体库")
    if status != 200:
        raise ValueError(f"所选用户的媒体库验证失败（HTTP {status}）")


def local_continuebox_users() -> list[dict]:
    with main.db() as conn:
        return [dict(row) for row in conn.execute("SELECT id,username FROM users ORDER BY username COLLATE NOCASE")]


def save_binding(continuebox_user_id: int, base_url: str, emby_user_id: str,
                 api_key: str, server_id: str):
    now = int(time.time() * 1000)
    with main.db() as conn:
        conn.execute("""INSERT INTO emby_accounts
          (user_id,base_url,emby_user_id,access_token,server_id,created_at,updated_at)
          VALUES(?,?,?,?,?,?,?) ON CONFLICT(user_id) DO UPDATE SET base_url=excluded.base_url,
          emby_user_id=excluded.emby_user_id,access_token=excluded.access_token,
          server_id=excluded.server_id,updated_at=excluded.updated_at""",
          (continuebox_user_id, base_url, emby_user_id, main.seal_secret(api_key), server_id, now, now))


def run():
    main.startup()
    local_user = choose("请选择要绑定的续映账号：", local_continuebox_users(), "username")
    base_url = validate_base_url(required("小雅 Emby 地址（例如 http://192.168.8.129:6908）："))
    print("请粘贴在 Emby 管理界面创建、名称建议为 ContinueBox 的 API 密钥。")
    api_key = required("Emby API 密钥（输入不显示）：", secret=True)
    emby_users, server_id = fetch_emby_users(base_url, api_key)
    emby_user = choose("请选择播放记录归属的 Emby 用户：", emby_users, "Name")
    verify_selected_user(base_url, api_key, emby_user["Id"])
    save_binding(local_user["id"], base_url, emby_user["Id"], api_key, server_id)
    print(f"\n配置成功：续映账号“{local_user['username']}” ↔ Emby 用户“{emby_user.get('Name') or '未命名'}”。")
    print("API 密钥已加密保存，仅飞牛同步服务可用；未显示、未写入 APK。")


if __name__ == "__main__":
    try:
        run()
    except (EOFError, KeyboardInterrupt):
        print("\n已取消。", file=sys.stderr)
        raise SystemExit(1)
    except Exception as exc:
        print("配置失败：" + str(exc), file=sys.stderr)
        raise SystemExit(1)
