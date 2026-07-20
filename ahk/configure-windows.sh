#!/usr/bin/env bash

set -e

WINDOWS_USER=$(powershell.exe '$env:USERNAME' | tr -d '\r')
AHK_DIR="$HOME/.dotfiles/ahk"
STARTUP_DIR="/mnt/c/Users/$WINDOWS_USER/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

echo "Copying AHK scripts to Startup folder..."

mkdir -p "$STARTUP_DIR"

cp -v "$AHK_DIR/windows-keybindings/background-script.ahk" "$STARTUP_DIR/"
cp -v "$AHK_DIR/vd-commander/vd-commander.ahk" "$STARTUP_DIR/"
cp -v "$AHK_DIR/vd-commander/main.py" "$STARTUP_DIR/"
cp -v "$AHK_DIR/vd-commander/requirements.txt" "$STARTUP_DIR/"

echo "Done!"
