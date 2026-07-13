#!/usr/bin/env bash

set -e

WINDOWS_USER=$(powershell.exe '$env:USERNAME' | tr -d '\r')
BASE_DOTFILES="$HOME/.dotfiles/alacritty.global/.config/alacritty"
WINDOWS_DOTFILES="$HOME/.dotfiles/alacritty.windows/.config/alacritty"
ALACRITTY_DIR="/mnt/c/Users/$WINDOWS_USER/AppData/Roaming/alacritty"

echo "Copying Alacritty config..."

mkdir -p "$ALACRITTY_DIR"

cp -v "$BASE_DOTFILES/alacritty.toml" "$ALACRITTY_DIR/"
cp -v "$WINDOWS_DOTFILES/os.toml" "$ALACRITTY_DIR/"

echo "Done!"
