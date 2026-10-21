"""Install into an existing container with a SQLite snapshot and code rollback copy.
The same app source must also be installed in the host build directory before rebuilding.
"""
import hashlib
import json
import os
import shutil
import sqlite3
import sys
import time
from pathlib import Path

source = Path(__file__).resolve().parent / "app"
data = Path("/data")
target = Path("/app/app")
if not data.is_dir() or not target.is_dir() or not (source / "security.py").is_file():
    raise SystemExit("Not an existing ContinueBox container or incomplete update")
manifest = json.loads((source.parent / "code-sha256.json").read_text())
for name, expected in manifest.items():
    path = source.parent / name
    if path.resolve().parent not in (source.resolve(), source.parent.resolve()):
        raise SystemExit("Invalid manifest path")
    if hashlib.sha256(path.read_bytes()).hexdigest() != expected:
        raise SystemExit("Update integrity check failed")
backup = data / "upgrade-backups" / time.strftime("%Y%m%d-%H%M%S")
backup.mkdir(parents=True, mode=0o700)
os.chmod(backup, 0o700)
with sqlite3.connect(data / "tvbox-sync.db") as db, sqlite3.connect(backup / "tvbox-sync.db") as out:
    db.backup(out)
    if out.execute("PRAGMA integrity_check").fetchone()[0] != "ok":
        raise SystemExit("Database snapshot failed integrity check")
    before = {table: out.execute("SELECT count(*) FROM " + table).fetchone()[0]
              for table in ("users", "records", "favorites")}
shutil.copytree(target, backup / "app", ignore=shutil.ignore_patterns("__pycache__"))
if (data / "security.env").exists():
    shutil.copy2(data / "security.env", backup / "security.env")
    os.chmod(backup / "security.env", 0o600)
for path in source.iterdir():
    if path.is_file() and path.suffix in (".py", ".html"):
        temp = target / (path.name + ".upgrade")
        shutil.copy2(path, temp)
        os.replace(temp, target / path.name)
print(json.dumps({"installed_code": "0.27.1", "backup": str(backup), "preserved": before,
                  "next": "Restart the existing container; do not recreate until the host build source is also updated."}))
