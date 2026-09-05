#!/usr/bin/env bash
# Bootstrap dotfiles with GNU Stow.
#
# Usage:
#   ./bootstrap.sh            # dry-run first; prompts on conflicts
#   ./bootstrap.sh --adopt    # auto-adopt conflicting files into the repo
#
# Stows this repo onto $HOME. OS detection decides which packages are stowed:
#   universal set (all OSes): nvim tmux git starship alacritty
#   linux-desktop set (Omarchy, or Linux with Hyprland): hypr waybar walker uwsm omarchy-local
#   macos set (Darwin): macos
#
# Package installation is MANUAL and per-OS. If stow is missing this script
# prints the one-line install command for your OS and exits without installing.
#
# Conflict handling: `stow -n` dry-run runs first. If a real file on the
# machine blocks a symlink, `stow --adopt` is offered per package: the
# existing file is moved INTO the repo and replaced by a symlink. Review and
# commit the adopted file yourself — nothing is overwritten silently.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${HOME}"
AUTO_ADOPT=0
if [ "${1:-}" = "--adopt" ]; then
  AUTO_ADOPT=1
fi

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
linux_desktop=(hypr waybar walker uwsm omarchy-local)
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

# --- dry run first ---
failing=()
for pkg in "${packages[@]}"; do
  if ! stow -n -d "$DOTFILES_DIR" -t "$TARGET" "$pkg" 2>/tmp/stow-dryrun.log; then
    failing+=("$pkg")
    echo "[conflict] $pkg:"
    sed 's/^/    /' /tmp/stow-dryrun.log
  fi
done

# --- adopt conflicting packages ---
if [ "${#failing[@]}" -gt 0 ]; then
  echo
  echo "The machine already has files where these packages want symlinks."
  echo "Nothing has been modified yet."
  echo

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

# --- stow all non-conflicting packages ---
for pkg in "${packages[@]}"; do
  if [[ " ${failing[*]} " != *" $pkg "* ]]; then
    stow -d "$DOTFILES_DIR" -t "$TARGET" "$pkg"
    echo "stowed $pkg"
  fi
done

echo
echo "Done. Verify with:  stow -n -d \"$DOTFILES_DIR\" -t \"$TARGET\" ${packages[*]}"
