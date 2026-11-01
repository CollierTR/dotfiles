#!/usr/bin/env bash

set -e

WINDOWS_USER=$(powershell.exe '$env:USERNAME' | tr -d '\r')
AHK_DIR="$HOME/.dotfiles/ahk"
WINDOWS_HOME="/mnt/c/Users/$WINDOWS_USER"
INSTALL_DIR="$WINDOWS_HOME/AppData/Local/dotfiles-ahk"
STARTUP_DIR="$WINDOWS_HOME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
INSTALL_DIR_WIN="C:\\Users\\$WINDOWS_USER\\AppData\\Local\\dotfiles-ahk"
STARTUP_DIR_WIN="C:\\Users\\$WINDOWS_USER\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup"

create_shortcut() {
    local target="$1"
    local workdir="$2"
    local link="$3"

    powershell.exe -NoProfile -Command "\$ws = New-Object -ComObject WScript.Shell; \$sc = \$ws.CreateShortcut('$link'); \$sc.TargetPath = '$target'; \$sc.WorkingDirectory = '$workdir'; \$sc.Save()"
}

echo "Installing AHK scripts to $INSTALL_DIR..."

mkdir -p "$INSTALL_DIR/vd-commander" "$STARTUP_DIR"

cp -v "$AHK_DIR/windows-keybindings/background-script.ahk" "$INSTALL_DIR/"
cp -v "$AHK_DIR/vd-commander/vd-commander.ahk" "$INSTALL_DIR/vd-commander/"
cp -v "$AHK_DIR/vd-commander/main.py" "$INSTALL_DIR/vd-commander/"
cp -v "$AHK_DIR/vd-commander/requirements.txt" "$INSTALL_DIR/vd-commander/"

echo "Installing Python dependencies..."
if ! powershell.exe -NoProfile -Command "python -m pip install --user -r '$INSTALL_DIR_WIN\\vd-commander\\requirements.txt'"; then
    echo "Warning: could not install Python dependencies. Run 'pip install pyvda' manually."
fi

echo "Creating Startup shortcuts..."
create_shortcut "$INSTALL_DIR_WIN\\background-script.ahk" "$INSTALL_DIR_WIN" "$STARTUP_DIR_WIN\\background-script.lnk"
create_shortcut "$INSTALL_DIR_WIN\\vd-commander\\vd-commander.ahk" "$INSTALL_DIR_WIN\\vd-commander" "$STARTUP_DIR_WIN\\vd-commander.lnk"

echo "Removing old startup entries..."
for file in background-script.ahk vd-commander.ahk main.py requirements.txt; do
    rm -f "$STARTUP_DIR/$file"
done

echo "Done!"
