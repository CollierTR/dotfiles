# AGENTS.md

## Repo structure

Top-level directories map 1:1 to dotfiles modules. Each mirrors its intended
install path under `$HOME`:

```
bash/        → ~/.bashrc, ~/.bashrc.d/*, ~/.inputrc
hyprland/    → ~/.config/hypr/
keyd/        → /etc/keyd/
newsboat/    → ~/.newsboat/
node/        → ~/.nvmrc
nvim/        → ~/.config/nvim/
opencode/    → ~/.config/opencode/
tmux/        → ~/.tmux.conf
wallpaper/   → image files (no install script)
```

## Conventions

- **Commits**: conventional commits with scope matching the module directory name
  (e.g. `feat(nvim):`, `fix(bash):`). Keep scopes lowercase.
- **Dotfiles are not managed by any tool** (no chezmoi, gnu stow, etc.). Just
  symlink or copy manually. Do not assume an install mechanism exists.

## nvim (`nvim/.config/nvim/`)

- Custom kickstart-style Neovim config, **not** LazyVim or a distribution.
- Entrypoint: `init.lua` bootstraps `lazy.nvim`, then `require("config.lazy")`.
- Plugin specs live in `lua/plugins/` — one file per plugin.
- Core config in `lua/config/` (lazy.lua, keymaps.lua, options.lua, autocmds.lua).
- Plugin versions pinned via `lazy-lock.json` — commit this file after adding
  or updating plugins.
- Colorscheme defaults to `gruvbox` (set in `plugins/theme.lua`).
- Leader key: space. Keymaps in `lua/config/keymaps.lua`.
- Completion engine: `blink.cmp` (not nvim-cmp). Config in `plugins/auto-completion.lua`.
- File explorer: `nvim-tree` on the **right** side with `adaptive_size = true`.

## bash (`bash/.bashrc.d/`)

Modular shell config sourced by `.bashrc`:
- `aliases.sh` — `ls` wraps `lsd`, git log shorthand, notebook helpers
- `exports.sh` — `EDITOR=nvim`, `VISUAL=nvim`, PATH additions, CA certs
- `functions.sh` — `ai` (opencode prompt via CLI), `commit-help` (cheat sheet)
- `nvm.sh` — auto-switch Node version on directory change via `.nvmrc`
- `.inputrc` — vi mode with cursor shape changes (block in normal, beam in insert)

## opencode (`opencode/.config/opencode/`)

- Permissions: most bash/fs operations allowed; git commands and destructive
  operations denied.
- MCP: Todoist connected via `mcp-remote`.
- TUI theme: gruvbox (Nord-palette theme available at `themes/my-theme.json`).
- Skills directory: `skills/` contains per-task skill files (daily brief,
  monthly review, weekly review, todoist-process-tasks).
- Ignored by its own `.gitignore`: `node_modules`, `package.json`,
  `package-lock.json`, `bun.lock`.

## keyd (`keyd/etc/keyd/`)

System-level keyboard remapping (runs as a service — requires root to install).
- `default.conf`: Caps Lock mapped to `overload(meta, esc)` (tap=Esc, hold=Meta).
  - Shift+`capslock` = Caps Lock passthrough.
- Z key activates a navigation layer:
  - `z+{h,j,k,l}` → arrow keys; `z+{i,o}` → `zi`/`zo` (fold commands).
  - `z+m` → media layer: `m+{j,k,l}` → previous/play/next track.

## tmux (`tmux/.tmux.conf`)

- Plugins via TPM: `tmux-plugins/tpm`, `jaclu/tmux-menus`.
- Splits: `|` horizontal, `-` vertical. Vim-style `h/j/k/l` pane navigation.
- Windows/pane numbering: 1-based (`base-index 1`, `pane-base-index 1`).
- Status bar at top, gruvbox colors.

## Node

`.nvmrc` specifies Node 26 with `min-release-age=7`. Auto-switched by
`bash/.bashrc.d/nvm.sh` on directory entry.
