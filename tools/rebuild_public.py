"""Rebuild the public APK from a verified base and the published source overlay."""
import argparse, hashlib, json, shutil, subprocess
from pathlib import Path

root=Path(__file__).resolve().parents[1]
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--base',type=Path,required=True)
parser.add_argument('--apktool',type=Path,required=True,help='Apktool 3.0.3 jar')
parser.add_argument('--java',default='java')
parser.add_argument('--work',type=Path,default=root/'public-build')
parser.add_argument('--output',type=Path,default=root/'ContinueBox-2.2.5-unsigned.apk')
args=parser.parse_args()
m=json.loads((root/'client-patches/2.2.5/manifest.json').read_text(encoding='utf-8'))
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
if digest(args.base)!=m['base_sha256']:raise SystemExit('Base SHA256 mismatch; refusing an unrelated APK.')
if args.work.exists():raise SystemExit('Work directory exists; choose a new --work directory.')
overlay=root/'client-patches/2.2.5/overlay'
for rel,expected in m['files'].items():
    p=overlay/rel
    if not p.resolve().is_relative_to(overlay.resolve()) or digest(p)!=expected:raise SystemExit('Invalid overlay: '+rel)
subprocess.run([args.java,'-jar',str(args.apktool.resolve()),'d','-f',str(args.base.resolve()),'-o',str(args.work.resolve())],check=True)
for rel in m['deleted']:
    p=args.work/rel
    if not p.resolve().is_relative_to(args.work.resolve()):raise SystemExit('Invalid deletion path')
    p.unlink(missing_ok=True)
for rel in m['files']:
    p=args.work/rel;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(overlay/rel,p)
subprocess.run([args.java,'-jar',str(args.apktool.resolve()),'b',args.work.name,'--force','-o',str(args.output.resolve())],cwd=args.work.resolve().parent,check=True)
print('Unsigned APK ready. Use Android SDK zipalign and apksigner with your own keystore.')
