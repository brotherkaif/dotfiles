# dotfiles

Cross-platform dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).
One repo, one layout, bootstrapped identically on all machines (2× Omarchy /
Arch + Hyprland, 2× macOS). Linux/Wayland-only packages are only ever stowed on
the Omarchy hosts.

- No templates, no secret managers, no nix/home-manager. Plain symlinks, plain
  stow, plain git.
- Tracked configs are user-owned only. Anything Omarchy-owned, machine-specific,
  or secret lives outside this repo (see "Never track" below).

## Layout

Package-per-tool. The repo root is the stow directory; each package mirrors a
`$HOME`-relative path. Stow with `stow -d ~/dotfiles -t ~ <package>`.

| Package          | Maps onto                   | Set            | Notes |
|------------------|-----------------------------|----------------|-------|
| `nvim`           | `.config/nvim/`             | universal      | LazyVim |
| `tmux`           | `.config/tmux/tmux.conf`    | universal      | cross-OS clipboard |
| `git`            | `.config/git/config`, `.gitconfig`, `.gitignore_global` | universal | |
| `starship`       | `.config/starship.toml`     | universal      | |
| `alacritty`      | `.config/alacritty/`        | universal      | see Omarchy notes |
| `hypr`           | `.config/hypr/`             | linux-desktop  | Omarchy only |
| `waybar`         | `.config/waybar/`           | linux-desktop  | not yet configured |
| `walker`         | `.config/walker/`           | linux-desktop  | not yet configured |
| `uwsm`           | `.config/uwsm/`             | linux-desktop  | not yet configured |
| `omarchy-local`  | `.local/bin/`               | linux-desktop  | personal scripts; not yet configured |
| `macos`          | `$HOME` (darwin-specific)   | macos          | not yet configured |

## Per-OS stow sets

- **universal** (all OSes): `nvim tmux git starship alacritty`
- **linux-desktop** (Omarchy, or Linux with Hyprland): `hypr waybar walker uwsm omarchy-local`
- **macos**: `macos`

Detection: Darwin → macos; `grep -qi omarchy /etc/os-release` or Linux with
`Hyprland` on PATH → linux-desktop.

## Bootstrap

```sh
./bootstrap.sh            # dry-runs with `stow -n` first; prompts on conflicts
./bootstrap.sh --adopt    # auto-adopt conflicting files into the repo
```

The script:

1. Checks stow is installed — if not, prints the one-line install command for
   the detected OS (`brew install stow` / `pacman -S stow`) and exits. It never
   installs anything.
2. Selects the package set for the detected OS.
3. Runs `stow -n` (dry run) first. If the machine already has files where a
   package wants symlinks (fresh Omarchy installs ship defaults), it offers
   `stow --adopt` **per package**: the existing file is moved into the repo and
   replaced with a symlink. Review and commit the adopted file — nothing is
   overwritten silently.
4. Is idempotent — safe to re-run.

## Required manual packages (per OS)

Nothing is installed automatically. Install these yourself:

- **All OSes**: `stow`, `neovim`, `tmux`, `git`, `starship`, `alacritty`, a
  Nerd Font (configs reference `JetBrainsMono Nerd Font`; install it on macOS
  via `brew install --cask font-jetbrains-mono-nerd-font`).
- **Omarchy/Arch**: stow via `pacman -S stow`. Everything else (hypr, waybar,
  walker, uwsm, Hyprland, wl-clipboard) is already present on Omarchy. Install
  `wl-clipboard` if missing (tmux clipboard uses `wl-copy`/`wl-paste`, with
  `xclip` as fallback).
- **macOS**: stow via `brew install stow`. tmux clipboard uses `pbcopy`/
  `pbpaste` automatically (no extra install).

## Daily workflow

Because each tracked file is a symlink into this repo, editing a config edits
the repo file directly:

```sh
# edit ~/.config/nvim/...  (it IS dotfiles/nvim/.config/nvim/...)
git -C ~/dotfiles add -A
git -C ~/dotfiles commit -m "nvim: ..."
git -C ~/dotfiles push
# on another machine:  git -C ~/dotfiles pull
```

## Never track (deliberately ignored / excluded)

- `~/.local/share/omarchy/**` — owned by Omarchy itself.
- Anything with secrets, tokens, or machine-identifying data: ssh keys,
  `.netrc`, browser profiles, `.env`, tokens. See `.gitignore` and
  `git/.gitignore_global`.
- Caches, plugin-manager state, `node_modules`, `~/.local/state`, `~/.cache`.

## Omarchy-specific notes

- **`alacritty`** imports the Omarchy theme from
  `~/.local/state/omarchy/current/theme/alacritty.toml` (kept as-is). That path
  only exists on Omarchy — on macOS, remove/adjust that `general.import` line
  or alacritty will fail to start.
- **`nvim`** does not track `lua/plugins/theme.lua` — on Omarchy that file is a
  symlink into `~/.local/state/omarchy/current/theme/neovim.lua`, generated and
  managed by Omarchy's theme system. Tracking it would commit a dangling
  symlink / Omarchy state. Without it (macOS), LazyVim falls back to its
  default colorscheme. `lua/config/remote_clipboard.lua` reads `/proc` for
  remote-session detection; the reads are `pcall`-wrapped so it degrades
  gracefully on macOS.
- **`tmux`** `?` keybinding opens `omarchy-menu-tmux-keybindings`, which only
  exists on Omarchy. Clipboard itself is cross-OS (see "Required packages").

## History

The previous Nix-based config was declared obsolete and is preserved — not
ported — under the `nix-archive` tag. `main` starts from an empty initial
commit. Nothing from the Nix config was carried over.
