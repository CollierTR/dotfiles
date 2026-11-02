# AHK (AutoHotkey)

Windows keybinding scripts for keyboard-driven workflow.

## Prerequisites

- [AutoHotkey v2](https://www.autohotkey.com/) installed on Windows
- Python 3 with pip

## Setup

1. Run the setup script from WSL:
   ```
   ~/.dotfiles/ahk/configure-windows.sh
   ```
   This copies the scripts to `%LOCALAPPDATA%\dotfiles-ahk\`, installs the
   Python dependency, and creates shortcuts in your Windows Startup folder so
   they run on login. Only `background-script.lnk` and `vd-commander.lnk` live
   in Startup — never the `.py` or `.txt` files.

**Manual alternative:**
1. Copy `windows-keybindings/background-script.ahk` and the contents of
   `vd-commander/` to `%LOCALAPPDATA%\dotfiles-ahk\` (with
   `vd-commander.ahk` and `main.py` together in the `vd-commander\` folder).
2. Install the dependency:
   ```
   pip install -r %LOCALAPPDATA%\dotfiles-ahk\vd-commander\requirements.txt
   ```
3. Create shortcuts to the two `.ahk` files in
   `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\`. Set each
   shortcut's "Start in" to the folder containing its `.ahk` file so
   `main.py` resolves correctly.

## Scripts

### background-script.ahk

Key remappings, navigation layer, app launchers, and hot strings.

### vd-commander.ahk

Virtual desktop management inspired by Hyprland workspaces.

## Keybinding Reference

### background-script.ahk

**Z Layer** (hold `z`):
| Key | Action |
|-----|--------|
| `j/k/h/l` | Arrow keys (Down/Up/Left/Right) |
| `i` | `zi` (fold open) |
| `o` | `zo` (fold close) |
| `e` / `g` | Type email address |
| `v` | Ctrl+Shift+V (paste plain text) |
| `n` | Ctrl+Shift+A (select all) |
| `x` | Alt+F4 (close window) |

**Key Remappings:**
| Key | Action |
|-----|--------|
| CapsLock | Esc |
| Esc | CapsLock |
| Alt+h / Alt+l | Left / Right arrow |
| Shift+Alt+h/l | Select left/right |

**App Launchers:**
| Shortcut | Action |
|----------|--------|
| Win+Enter | Alacritty terminal |
| Win+b | Chrome |
| Win+t | Todoist |
| Alt+t | Todoist quick add |
| Win+a | ChatGPT |
| Win+c | Calendar |
| Win+Alt+c | New Google Calendar event |
| Win+s | Spotify |
| Win+y | YouTube (app mode) |
| Win+x | Excalidraw |
| Win+o | Downloads folder |
| Win+/ | AHK help file |

**Hot Strings:**
| Trigger | Output |
|---------|--------|
| `btw` + space/tab | by the way |
| `brb` + space/tab | be right back |
| Ctrl+Shift+0 | Types work email |

### vd-commander.ahk

**Semicolon Layer** (hold `;`):
| Key | Action |
|-----|--------|
| `w` | `:w` (save) |
| `q` | `:q` (quit) |
| `1-6` | Switch to desktop 1-6 |

**Virtual Desktops:**
| Shortcut | Action |
|----------|--------|
| Win+1-6 | Switch to desktop 1-6 |
| Alt+1-6 | Move window to desktop 1-6 |
| Win+Alt+1-6 | Move window and follow |
| Win+p | Pin/unpin window to all desktops |

**Window Management:**
| Shortcut | Action |
|----------|--------|
| Alt+Win+h/j/k/l | Move window between zones |
| Ctrl+Shift+h/l | Move window between screens |
| Win+w | Close window (Alt+F4) |
