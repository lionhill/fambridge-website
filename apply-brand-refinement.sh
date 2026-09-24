#!/usr/bin/env bash
set -euo pipefail

VERSION="20260923-1"

ROOT_FILES=(
  "index.html"
  "business.html"
  "products.html"
  "rondo-radio.html"
  "about.html"
  "contact.html"
)

FR_FILES=(
  "fr/index.html"
  "fr/business.html"
  "fr/products.html"
  "fr/rondo-radio.html"
  "fr/about.html"
  "fr/contact.html"
)

python3 - "$VERSION" "${ROOT_FILES[@]}" --fr "${FR_FILES[@]}" <<'PY'
from pathlib import Path
import re
import sys

args = sys.argv[1:]
version = args[0]
sep = args.index("--fr")
root_files = args[1:sep]
fr_files = args[sep+1:]

def update(path_str, fr=False):
    p = Path(path_str)
    if not p.exists():
        print(f"skip: {p} (not found)")
        return

    s = p.read_text(encoding="utf-8")
    prefix = "../" if fr else ""

    s = re.sub(
        r'((?:\.\./)?assets/img/fambridge-logo\.jpg)(?:\?v=[^"]+)?',
        rf'\1?v={version}',
        s
    )

    href = f'{prefix}assets/css/brand-refinement.css?v={version}'
    if "brand-refinement.css" not in s:
        pattern = re.compile(
            rf'(<link rel="stylesheet" href="{re.escape(prefix)}assets/css/site\.css[^"]*">)'
        )
        replacement = rf'\1\n  <link rel="stylesheet" href="{href}">'
        s, n = pattern.subn(replacement, s, count=1)
        if n == 0:
            raise RuntimeError(f"Could not find site.css link in {p}")

    p.write_text(s, encoding="utf-8")
    print(f"updated: {p}")

for f in root_files:
    update(f, False)

for f in fr_files:
    update(f, True)
PY

echo
echo "Brand refinement applied locally."
echo "Review with git diff before committing."
