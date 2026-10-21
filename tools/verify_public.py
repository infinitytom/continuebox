"""Verify public patch digests and reject private deployment files."""
from pathlib import Path
import hashlib, json
root=Path(__file__).resolve().parents[1]
folder=root/'client-patches/2.2.5'
m=json.loads((folder/'manifest.json').read_text(encoding='utf-8'))
for rel,expected in m['files'].items():
    p=folder/'overlay'/rel
    assert p.resolve().is_relative_to((folder/'overlay').resolve()),rel
    assert hashlib.sha256(p.read_bytes()).hexdigest()==expected,rel
hashes=json.loads((root/'sync-server/code-sha256.json').read_text())
for p in (root/'sync-server/app').glob('*'):
    if p.suffix not in ('.py','.html'):continue
    assert hashlib.sha256(p.read_bytes()).hexdigest()==hashes[p.relative_to(root/'sync-server').as_posix()],p.name
for folder_name in ('client-patches/2.2.5/overlay','native-ui/cards/src'):
    for p in (root/folder_name).rglob('*'):
        if p.is_file() and p.suffix in ('.kt','.java','.smali','.xml','.json'):
            s=p.read_text(encoding='utf-8')
            assert not any(v in s for v in ('.duckdns.org', ':18443', 'tom-')),p
assert not (root/'sync-server/.env').exists()
print(f'Verified {len(m["files"])} overlay files, server code digests and public endpoint hygiene.')
