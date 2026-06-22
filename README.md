# dotfiles

<!-- screenshot.png -->

configuration files for the tools i use daily. managed with GNU Stow, no
bootstrap script, no nonsense.

## modules

modules mirror their install path under `$HOME`:

| directory     | installs to                      |
|---------------|----------------------------------|
| `bash/`       | `~/.bashrc`, `~/.bashrc.d/`, `~/.inputrc` |
| `hyprland/`   | `~/.config/hypr/`                |
| `keyd/`       | `/etc/keyd/`                     |
| `newsboat/`   | `~/.newsboat/`                   |
| `node/`       | `~/.nvmrc`                       |
| `nvim/`       | `~/.config/nvim/`                |
| `opencode/`   | `~/.config/opencode/`            |
| `tmux/`       | `~/.tmux.conf`                   |
| `wallpaper/`  | image files (no install target)  |

## breakdown

### bash

`bash/.bashrc.d/` is split into aliases, exports, and functions:

- **aliases** -- `ls` wraps `lsd`, git log shorthand, notebook helpers
- **exports** -- `EDITOR=nvim`, `VISUAL=nvim`, PATH additions, CA certs
- **functions** -- `ai` pipes stdin to opencode, `commit-help` shows a cheat
  sheet
- **nvm** -- auto-switches node version on directory change via `.nvmrc`
- **inputrc** -- vi mode with block cursor in normal, beam in insert

### hyprland

wayland compositor config. no frills.

### keyd

system-level keyboard remapping (requires root to install).

- caps lock is `overload(meta, esc)` -- tap sends Escape, hold sends Meta
- shift+capslock passes through as caps lock
- z key activates a navigation layer:
  - `z+h/j/k/l` = arrow keys
  - `z+i/o` = `zi`/`zo` (vim fold commands)
  - `z+m` = media layer, then `m+j/k/l` = previous/play/next track

### newsboat

rss reader config.

### node

single `.nvmrc` file specifying Node 26 with `min-release-age=7`.

### nvim

kickstart-style config, not LazyVim or a distribution.

- `init.lua` bootstraps `lazy.nvim`, then `require("config.lazy")`
- plugin specs live in `lua/plugins/` -- one file per plugin
- core config in `lua/config/` (lazy.lua, keymaps.lua, options.lua, autocmds.lua)
- versions pinned via `lazy-lock.json`
- colorscheme: gruvbox
- leader: space
- completion: `blink.cmp` (not nvim-cmp)
- file explorer: nvim-tree on the right, `adaptive_size = true`

### opencode

AI coding assistant configuration.

- permissions: bash/fs allowed, git and destructive ops denied
- MCP: todoist connected via `mcp-remote`
- TUI theme: gruvbox (nord-palette theme also available)
- skills: daily brief, weekly review, monthly review, todoist task processing

### tmux

- plugins via TPM: `tmux-plugins/tpm`, `jaclu/tmux-menus`
- splits: `|` horizontal, `-` vertical
- navigation: vim-style `h/j/k/l` between panes
- numbering: 1-based (windows and panes)
- status bar at top, gruvbox colors

### wallpaper

collection of 9 images (jpg/png). no install script.

## install

clone to `~/.dotfiles` and use GNU Stow:

```sh
git clone <repo> ~/.dotfiles
cd ~/.dotfiles
stow bash       # .bashrc, .bashrc.d, .inputrc
stow nvim       # .config/nvim
stow tmux       # .tmux.conf
stow opencode   # .config/opencode
stow hyprland   # .config/hypr
stow node       # .nvmrc
stow newsboat   # .newsboat
sudo stow keyd  # /etc/keyd (requires root)
```

