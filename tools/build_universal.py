"""Rebuild 2.2.5 with an independent app ID and verified ARM32 + ARM64 libraries."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import zipfile

root = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--base', type=Path, required=True, help='Original ContinueBox-2.2.5.apk')
parser.add_argument('--output', type=Path, required=True, help='New unsigned APK path')
parser.add_argument('--apktool', type=Path, required=True, help='Apktool 3.0.3 JAR')
parser.add_argument('--java', default='java')
parser.add_argument('--work', type=Path, required=True, help='New isolated decode directory')
args = parser.parse_args()
manifest = json.loads((root / 'client-patches/2.2.5/universal/manifest.json').read_text())
if hashlib.sha256(args.base.read_bytes()).hexdigest() != manifest['base_sha256']:
    raise SystemExit('Original release SHA256 mismatch')
libraries = {}
for name, item in manifest['libraries'].items():
    path = (root / item['path']).resolve()
    if not path.is_relative_to(root.resolve()):
        raise SystemExit('Library path outside source tree')
    data = path.read_bytes()
    if hashlib.sha256(data).hexdigest() != item['sha256']:
        raise SystemExit('Library SHA256 mismatch: ' + name)
    if data[:5] != b'\x7fELF\x01' or struct.unpack_from('<H', data, 18)[0] != 40:
        raise SystemExit('Expected ELF32 ARM library: ' + name)
    libraries[name] = data
if args.work.exists() or args.output.exists():
    raise SystemExit('Work/output already exists; choose new paths')
with zipfile.ZipFile(args.base) as source:
    expected = {Path(n).name for n in source.namelist() if n.startswith('lib/arm64-v8a/')}
    if expected != set(libraries):
        raise SystemExit('ARM32/ARM64 library sets differ')
subprocess.run([args.java, '-jar', str(args.apktool.resolve()), 'd', str(args.base.resolve()), '-o', str(args.work.resolve())], check=True)
old_id = 'com.github.tvbox.osc.jun'
new_id = 'com.continuebox.tv'
manifest_path = args.work / 'AndroidManifest.xml'
text = manifest_path.read_text(encoding='utf-8')
if text.count(old_id) != 5:
    raise SystemExit('Unexpected Manifest app ID/provider layout')
manifest_path.write_text(text.replace(old_id, new_id), encoding='utf-8')
configs = list(args.work.glob('smali*/com/github/tvbox/osc/BuildConfig.smali'))
if len(configs) != 1:
    raise SystemExit('Expected one application BuildConfig')
text = configs[0].read_text(encoding='utf-8')
if text.count(old_id) != 1:
    raise SystemExit('Unexpected BuildConfig app ID')
configs[0].write_text(text.replace(old_id, new_id), encoding='utf-8')
for name, data in libraries.items():
    path = args.work / 'lib/armeabi-v7a' / name
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)
subprocess.run([args.java, '-jar', str(args.apktool.resolve()), 'b', args.work.name, '--force', '-o', str(args.output.resolve())], cwd=args.work.resolve().parent, check=True)
print('Unsigned com.continuebox.tv ARM32 + ARM64 APK ready; zipalign and sign before use.')
