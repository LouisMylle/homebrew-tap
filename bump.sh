#!/bin/zsh
# ./bump.sh 1.5.0  →  points the cask at that GitHub release and commits
set -e
cd "$(dirname "$0")"
V="$1"; [[ -n "$V" ]] || { echo "usage: ./bump.sh <version>"; exit 1; }
URL="https://github.com/LouisMylle/ClaudeHub/releases/download/v$V/ClaudeHub-$V.zip"
SHA=$(curl -sL "$URL" | shasum -a 256 | awk '{print $1}')
sed -i '' -e "s/^  version \".*\"/  version \"$V\"/" -e "s/^  sha256 \".*\"/  sha256 \"$SHA\"/" Casks/claudehub.rb
git commit -qam "claudehub $V" && git push -q && echo "cask → $V ($SHA)"
