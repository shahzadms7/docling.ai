#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
if command -v pwsh >/dev/null 2>&1; then
  exec pwsh -NoProfile -File "$ROOT/001-start-here.ps1"
fi
if command -v powershell.exe >/dev/null 2>&1; then
  exec powershell.exe -NoProfile -File "$ROOT/001-start-here.ps1"
fi
echo "[STOP] Compatible local PowerShell executable not found." >&2
exit 2
