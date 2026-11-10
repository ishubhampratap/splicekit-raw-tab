#!/bin/bash
# Builds RAW Tab from source (or uses the prebuilt RawTab.dylib next to this script) and installs it into SpliceKit.
cd "$(dirname "$0")"
exec > >(tee install.log) 2>&1
if command -v clang >/dev/null; then
  clang -arch arm64 -mmacosx-version-min=14.0 -dynamiclib -fobjc-arc -framework AppKit -Wl,-undefined,dynamic_lookup -o RawTab.dylib RawTab.m || exit 1
fi
[ -f RawTab.dylib ] || { echo "No RawTab.dylib - install Xcode Command Line Tools (xcode-select --install)"; exit 1; }
codesign -s - -f RawTab.dylib && echo BUILD_OK
P="$HOME/Library/Application Support/SpliceKit/plugins/raw-tab"
mkdir -p "$P" && cp RawTab.dylib "$P/RawTab.tmp" && mv -f "$P/RawTab.tmp" "$P/RawTab.dylib" && cp plugin.json "$P/plugin.json" && echo "INSTALLED - restart Final Cut Pro (SpliceKit) to load it"
