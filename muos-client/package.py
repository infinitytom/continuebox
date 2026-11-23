"""Build the muOS archive and Windows setup tool using Go and Python 3."""

import hashlib
import os
from pathlib import Path
import subprocess
import sys
import tempfile
from urllib.request import urlretrieve
from zipfile import ZIP_DEFLATED, ZipFile, ZipInfo


ROOT = Path(__file__).resolve().parent
FONT_ROOT = (
    "https://raw.githubusercontent.com/google/fonts/"
    "a85815a42757630ce188fdad368c2dfc444d4773/ofl/notosanssc/"
)
FONT_FILES = {
    "NotoSansSC.ttf": (
        "NotoSansSC%5Bwght%5D.ttf",
        "a3041811a78c361b1de50f953c805e0244951c21c5bd412f7232ef0d899af0da",
    ),
    "OFL-NotoSansSC.txt": (
        "OFL.txt",
        "1c05c68c34f9708415aada51f17e1b0092d2cea709bf4a94cd38114f9e73d7d9",
    ),
}


def digest(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def build(go, target, arch, output):
    subprocess.run(
        [go, "build", "-trimpath", "-buildvcs=false", "-ldflags=-s -w", "-o", str(output), "."],
        cwd=ROOT,
        env=os.environ | {"GOOS": target, "GOARCH": arch, "CGO_ENABLED": "0"},
        check=True,
    )


def notices(go):
    def query(*args):
        return Path(subprocess.check_output([go, *args], cwd=ROOT, text=True).strip())

    projects = {"Go": query("env", "GOROOT")}
    for module in ("github.com/ebitengine/purego", "github.com/tailscale/hujson"):
        projects[module] = query("list", "-m", "-f", "{{.Dir}}", module)
    return "\n\n".join(
        f"{name}\n\n{(directory / 'LICENSE').read_text(encoding='utf-8')}"
        for name, directory in projects.items()
    ).encode()


def main():
    if len(sys.argv) not in (2, 3):
        raise SystemExit("usage: package.py OUTPUT_FOLDER [GO_EXECUTABLE]")
    out = Path(sys.argv[1]).resolve()
    go = sys.argv[2] if len(sys.argv) == 3 else "go"
    out.mkdir(parents=True, exist_ok=True)
    setup = out / "ContinueBox-TVBox-Setup.exe"
    archive = out / "ContinueBox-muOS-0.3.0-TVBox-preview.muxapp"
    with tempfile.TemporaryDirectory() as temporary:
        stage = Path(temporary)
        binary = stage / "continuebox"
        build(go, "linux", "arm64", binary)
        assets = {}
        for name, (upstream, expected) in FONT_FILES.items():
            path = stage / name
            cache = os.environ.get("CONTINUEBOX_FONT_CACHE")
            if cache:
                path.write_bytes((Path(cache) / name).read_bytes())
            else:
                urlretrieve(FONT_ROOT + upstream, path)
            if digest(path) != expected:
                raise ValueError(f"Unexpected SHA-256 for {name}")
            assets[name] = path.read_bytes()
        files = {
            "continuebox": binary.read_bytes(),
            "mux_launch.sh": (ROOT / "mux_launch.sh").read_text(encoding="utf-8").encode(),
            "mux_lang.ini": (ROOT / "mux_lang.ini").read_text(encoding="utf-8").encode(),
            "LICENSE": (ROOT.parent / "LICENSE").read_bytes(),
            "THIRD-PARTY-LICENSES.txt": notices(go),
            **assets,
        }
        with ZipFile(archive, "w", compression=ZIP_DEFLATED) as package:
            for name, data in files.items():
                entry = ZipInfo("ContinueBox/" + name)
                entry.create_system = 3
                mode = 0o755 if name in {"continuebox", "mux_launch.sh"} else 0o644
                entry.external_attr = (0o100000 | mode) << 16
                package.writestr(entry, data, compress_type=ZIP_DEFLATED)
    build(go, "windows", "amd64", setup)
    (out / "SHA256SUMS.txt").write_text(
        "".join(f"{digest(path)}  {path.name}\n" for path in (archive, setup)), encoding="ascii"
    )


if __name__ == "__main__":
    main()
