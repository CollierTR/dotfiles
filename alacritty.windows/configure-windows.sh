#!/usr/bin/env bash

set -e

# Resolve the signed-in Windows profile (works across machines with different usernames)
WIN_USERPROFILE=$(powershell.exe -NoProfile -Command 'Write-Output $env:USERPROFILE' | tr -d '\r')
WINDOWS_HOME=$(wslpath "$WIN_USERPROFILE")
BASE_DOTFILES="$HOME/.dotfiles/alacritty.global/.config/alacritty"
WINDOWS_DOTFILES="$HOME/.dotfiles/alacritty.windows/.config/alacritty"
ALACRITTY_DIR="$WINDOWS_HOME/AppData/Roaming/alacritty"

if [[ ! -d "$WINDOWS_HOME" ]]; then
  echo "error: Windows home not found at $WINDOWS_HOME (from $WIN_USERPROFILE)" >&2
  exit 1
fi

echo "Copying Alacritty config to $ALACRITTY_DIR..."

mkdir -p "$ALACRITTY_DIR"

cp -v "$BASE_DOTFILES/alacritty.toml" "$ALACRITTY_DIR/"
cp -v "$WINDOWS_DOTFILES/os.toml" "$ALACRITTY_DIR/"

echo "Done!"
