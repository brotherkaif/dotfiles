#!/usr/bin/env bash
# Bootstrap dotfiles with GNU Stow.
#
# Usage:
#   ./bootstrap.sh                  # dry-run first; prompts on conflicts
#   ./bootstrap.sh --adopt          # auto-adopt conflicting files into the repo
#   ./bootstrap.sh --prefer-repo    # replace conflicting files with repo versions (backup first)
#
# During every run it also auto-detects stale Neovim plugin-manager state
# (LazyVim's `lazy/`, Mason's `mason/`, or a stray `pack/deps`) that is not used
# by this MiniMax config and can break startup. If found, it prompts before
# backing them up and removing them (MiniMax reinstalls plugins on next launch via
# `:lua vim.pack.update()`). Nothing is wiped without your confirmation.
#
# Stows this repo onto $HOME. OS detection decides which packages are stowed:
#   universal set (all OSes): nvim tmux git starship alacritty
#   linux-desktop set (Omarchy, or Linux with Hyprland): hypr waybar walker uwsm omarchy-local omarchy
#   macos set (Darwin): macos
#
# Package installation is MANUAL and per-OS. If stow is missing this script
# prints the one-line install command for your OS and exits without installing.
#
# Conflict handling: `stow -n` dry-run runs first. If a real file on the
# machine blocks a symlink:
#   - default / --adopt: `stow --adopt` moves the existing file INTO the repo
#     and replaces it with a symlink. Review and commit the adopted file
#     yourself — nothing is overwritten silently. Use this when the machine's
#     config is something you want to keep as the new repo content.
#   - --prefer-repo: the repo is the source of truth. Blocking files are
#     backed up to ~/.dotfiles-backup-<timestamp>/ (preserving relative
#     paths), then the repo version is symlinked. Use this on fresh installs
#     where the machine only has stock defaults (e.g. tmux/git edits would be
#     clobbered by adopting the stock files).

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${HOME}"
AUTO_ADOPT=0
PREFER_REPO=0
for arg in "$@"; do
  case "$arg" in
    --adopt) AUTO_ADOPT=1 ;;
    --prefer-repo) PREFER_REPO=1 ;;
  esac
done

# --- stow presence (never auto-install) ---
if ! command -v stow >/dev/null 2>&1; then
  case "$(uname -s)" in
    Darwin) echo "stow is required but not installed. Install it with:  brew install stow" >&2 ;;
    Linux)  echo "stow is required but not installed. Install it with:  pacman -S stow   (or your distro's equivalent)" >&2 ;;
    *)      echo "stow is required but not installed. Install it for your OS, then re-run this script." >&2 ;;
  esac
  exit 1
fi

# --- OS detection ---
os="unknown"
if [ "$(uname -s)" = "Darwin" ]; then
  os="macos"
elif grep -qi "omarchy" /etc/os-release 2>/dev/null; then
  os="linux-desktop"
elif [ "$(uname -s)" = "Linux" ] && command -v Hyprland >/dev/null 2>&1; then
  os="linux-desktop"
elif [ "$(uname -s)" = "Linux" ]; then
  os="linux"
fi

# --- package sets ---
universal=(nvim tmux git starship alacritty)
linux_desktop=(hypr waybar walker uwsm omarchy-local omarchy)
macos=(macos)

packages=("${universal[@]}")
case "$os" in
  linux-desktop) packages+=("${linux_desktop[@]}") ;;
  macos)         packages+=("${macos[@]}") ;;
esac

echo "Detected OS: $os"
echo "Stow directory: $DOTFILES_DIR"
echo "Target: $TARGET"
echo "Packages: ${packages[*]}"
echo

# --- detect + clean stale Neovim plugin-manager state ---------------------------------
# MiniMax uses the built-in `vim.pack`. Leftovers from a *different* plugin manager
# (LazyVim's `lazy/`, Mason's `mason/`, or any stray `pack/deps`) shadow the runtime
# path and break startup (e.g. old `mini.nvim` -> `safely` is nil). This is safe to
# wipe: MiniMax rebuilds everything via `:lua vim.pack.update()` on next run. We only
# remove these known foreign dirs and always back them up + ask first. `~/.config/nvim`
# (the symlink) and MiniMax's own `site/pack/core` are left untouched.
cleanup_foreign_dirs=(
  "$HOME/.local/share/nvim/lazy"            # LazyVim plugins
  "$HOME/.local/share/nvim/site/pack/deps"  # stray non-MiniMax `deps` pack
  "$HOME/.local/share/nvim/mason"           # Mason installed servers (MiniMax avoids Mason)
)

nvim_cleaned=0
for dir in "${cleanup_foreign_dirs[@]}"; do
  [ -e "$dir" ] || continue
  if [ "$nvim_cleaned" -eq 0 ]; then
    echo
    echo "Found stale Neovim plugin-manager state that is NOT used by the MiniMax config:"
  fi
  nvim_cleaned=1
  size="$(du -sh "$dir" 2>/dev/null | cut -f1)"
  echo "  - $dir  ($size)"
done

if [ "$nvim_cleaned" -eq 1 ]; then
  echo
  echo "These are leftovers from another plugin manager (LazyVim/Mason). They can shadow"
  echo "the MiniMax plugins and break Neovim startup. Deleting them is safe: MiniMax will"
  echo "reinstall all plugins via \`:lua vim.pack.update()\` on next launch."
  printf '%s ' 'Delete them (backed up to ~/.dotfiles-nvim-backup-<timestamp>/) ? [y/N] '
  read -r ans
  case "$ans" in
    y|Y|yes)
      backup_dir="$TARGET/.dotfiles-nvim-backup-$(date +%Y%m%d-%H%M%S)"
      mkdir -p "$backup_dir"
      for dir in "${cleanup_foreign_dirs[@]}"; do
        [ -e "$dir" ] || continue
        # Preserve relative path under the backup dir (e.g. site/pack/deps -> site/pack/)
        rel="${dir#$HOME/}"
        mkdir -p "$backup_dir/$(dirname "$rel")"
        mv "$dir" "$backup_dir/$rel"
        echo "  moved $dir -> $backup_dir/$rel"
      done
      echo "  Backed up to: $backup_dir"
      echo "  Next Neovim launch will reinstall plugins via vim.pack."
      ;;
    *)
      echo "  Skipping cleanup (stale Neovim state left in place)." ;;
  esac
fi

# --- dry run first ---
failing=()
for pkg in "${packages[@]}"; do
  if ! stow -n -d "$DOTFILES_DIR" -t "$TARGET" "$pkg" 2>/tmp/stow-dryrun.log; then
    failing+=("$pkg")
    echo "[conflict] $pkg:"
    sed 's/^/    /' /tmp/stow-dryrun.log
  fi
done

# --- resolve conflicting packages ---
if [ "${#failing[@]}" -gt 0 ]; then
  echo
  echo "The machine already has files where these packages want symlinks."
  echo "Nothing has been modified yet."
  echo

  if [ "$PREFER_REPO" -eq 1 ]; then
    BACKUP_DIR="$TARGET/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
    for pkg in "${failing[@]}"; do
      echo "  --prefer-repo $pkg (blocking files moved to $BACKUP_DIR/ ...)"
      while IFS= read -r rel; do
        [ -z "$rel" ] && continue
        target="$TARGET/$rel"
        if { [ -e "$target" ] || [ -L "$target" ]; } && { [ ! -d "$target" ] || [ -L "$target" ]; }; then
          mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
          mv "$target" "$BACKUP_DIR/$rel"
        fi
      done < <(cd "$DOTFILES_DIR/$pkg" && find . \( -type f -o -type l \) | sed 's|^\./||')
      stow -d "$DOTFILES_DIR" -t "$TARGET" "$pkg"
      echo "  -> stowed $pkg (repo version)"
    done
    echo "  Backups saved in: $BACKUP_DIR"
    echo "  Delete them only after verifying the machine works."
  else
    for pkg in "${failing[@]}"; do
      adopt=0
      if [ "$AUTO_ADOPT" -eq 1 ]; then
        adopt=1
      else
        printf 'Adopt existing files for package "%s" into the repo? (stow --adopt) [y/N] ' "$pkg"
        read -r ans
        case "$ans" in
          y|Y|yes) adopt=1 ;;
        esac
      fi

      if [ "$adopt" -eq 1 ]; then
        echo "  --adopt $pkg (existing files moved into $DOTFILES_DIR/$pkg/ ...)"
        stow -d "$DOTFILES_DIR" -t "$TARGET" --adopt "$pkg"
        echo "  -> adopted. REVIEW and COMMIT the files now in $DOTFILES_DIR/$pkg/ before they drift."
      else
        echo "  skipping $pkg (not stowed)"
      fi
    done
  fi
fi

# --- stow all non-conflicting packages ---
for pkg in "${packages[@]}"; do
  if [ "${#failing[@]}" -eq 0 ] || [[ " ${failing[*]} " != *" $pkg "* ]]; then
    stow -d "$DOTFILES_DIR" -t "$TARGET" "$pkg"
    echo "stowed $pkg"
  fi
done

echo
echo "Done. Verify with:  stow -n -d \"$DOTFILES_DIR\" -t \"$TARGET\" ${packages[*]}"
