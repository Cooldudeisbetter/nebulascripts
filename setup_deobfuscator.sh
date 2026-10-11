#!/usr/bin/env bash
# Sets up Luraph V15 Deobfuscator (https://github.com/caomod2077/Deobfuscator-Luraph-V15)
# on Linux by fetching the correct luau/luau-ast binaries.
set -euo pipefail

REPO_URL="https://github.com/caomod2077/Deobfuscator-Luraph-V15.git"
DEST="${1:-./deobfuscator}"

echo "[*] Cloning deobfuscator..."
git clone --depth 1 "$REPO_URL" "$DEST"

echo "[*] Fetching luau Linux binaries..."
TMP=$(mktemp -d)
curl -sL "https://github.com/luau-lang/luau/releases/latest/download/luau-ubuntu.zip" -o "$TMP/luau.zip"
unzip -o "$TMP/luau.zip" luau luau-ast -d "$DEST/bin/"
chmod +x "$DEST/bin/luau" "$DEST/bin/luau-ast"
rm -rf "$TMP"

echo "[+] Done. Usage:"
echo "    node $DEST/deob.js input.lua -o output.lua"
echo "    node $DEST/deob.js input.lua --detect"
