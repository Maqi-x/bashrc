#!/usr/bin/env bash

cd "$(dirname "$0")"
set -e

TARGET_DIR="${TARGET_DIR:-$HOME}"
BASHRC_DIR="$TARGET_DIR/configuration/bashrc"

echo "[info] Installing bashrc to $BASHRC_DIR"

mkdir -p "$BASHRC_DIR"
cp ./*.sh "$BASHRC_DIR"/

if [[ -f "$TARGET_DIR/.bashrc" ]]; then
    echo "[info] Backing up existing .bashrc -> .bashrc.bak"
    cp "$TARGET_DIR/.bashrc" "$TARGET_DIR/.bashrc.bak"
fi

ln -sf "$BASHRC_DIR/bashrc.sh" "$TARGET_DIR/.bashrc"
echo "[info] Done. Restart your shell."
