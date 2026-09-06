#!/usr/bin/env bash
# One-shot bootstrap for brotherkaif/dotfiles.
#
# Run it remotely (no prior checkout needed):
#   bash <(curl -fsSL https://raw.githubusercontent.com/brotherkaif/dotfiles/main/install.sh)
#
# Do NOT pipe to bash (`curl ... | bash`): the interactive prompts need stdin
# on the terminal, and the stow bootstrap below does too.
#
# What this does, idempotently (safe to re-run):
#   1. Detects the OS (macOS / Omarchy-Arch).
#   2. Ensures a package manager (Homebrew on macOS, if you agree).
#   3. Installs the minimum dependencies to clone + stow: git and stow.
#      (App packages like nvim/tmux/starship stay manual — see README.)
#   4. Clones ~/dotfiles (or pulls if it already exists), HTTPS or SSH.
#   5. Optionally hands off to bootstrap.sh --prefer-repo (repo is the source
#      of truth; conflicting stock files are backed up, not overwritten).
#
# Security: this runs code fetched over HTTPS from your own repo. Review it
# first if unsure:  curl -fsSL <url above> | less

set -euo pipefail

REPO_OWNER="brotherkaif"
REPO_NAME="dotfiles"
HTTPS_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}.git"
SSH_URL="git@github.com:${REPO_OWNER}/${REPO_NAME}.git"
DEST="$HOME/$REPO_NAME"

say() { printf '\n== %s ==\n' "$*"; }

# --- 1. OS detection ---
os="unknown"
case "$(uname -s)" in
  Darwin)
    os="macos"
    ;;
  Linux)
    if grep -qi omarchy /etc/os-release 2>/dev/null; then
      os="omarchy"
    elif command -v pacman >/dev/null 2>&1; then
      os="arch"
    fi
    ;;
esac

if [ "$os" = "unknown" ]; then
  echo "Unsupported OS: $(uname -s). This script supports macOS and Omarchy/Arch." >&2
  exit 1
fi
say "Detected OS: $os"

# --- 2. Package manager ---
if [ "$os" = "macos" ] && ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed."
  printf 'Install Homebrew now? [y/N] '
  read -r ans
  case "$ans" in
    y|Y|yes)
      say "Installing Homebrew (needs your password)"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      if [ -x /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)" || true
      elif [ -x /usr/local/bin/brew ]; then
        eval "$(/usr/local/bin/brew shellenv 2>/dev/null)" || true
      fi
      ;;
    *)
      echo "Install Homebrew first, then re-run this script:  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"" >&2
      exit 1
      ;;
  esac
fi

# --- 3. Minimum dependencies: git + stow ---
need_missing=0
command -v git >/dev/null 2>&1 || need_missing=1
command -v stow >/dev/null 2>&1 || need_missing=1

case "$os" in
  macos)
    brew list git >/dev/null 2>&1 || need_missing=1
    if [ "$need_missing" -eq 1 ]; then
      say "Installing git and stow via Homebrew"
      brew install git stow
    fi
    ;;
  omarchy|arch)
    if [ "$need_missing" -eq 1 ]; then
      say "Installing git and stow via pacman (needs your password)"
      sudo pacman -S --noconfirm --needed git stow
    fi
    ;;
esac
say "Dependencies ready: git ($(git --version)) and stow ($(stow --version | head -1))"

# --- 4. Clone / pull ---
if [ -d "$DEST/.git" ]; then
  say "$DEST already exists — pulling latest"
  git -C "$DEST" pull --ff-only
elif [ -e "$DEST" ]; then
  echo "ERROR: $DEST exists but is not a git repository." >&2
  echo "Move it out of the way and re-run this script." >&2
  exit 1
else
  transport=""
  printf 'Clone via HTTPS or SSH? [https/ssh] (default: https) '
  read -r transport
  transport="${transport:-https}"

  case "$transport" in
    ssh)
      if [ ! -f "$HOME/.ssh/id_ed25519" ] && ! ssh-add -l >/dev/null 2>&1; then
        echo "No SSH key found — falling back to HTTPS (works without auth for a public repo)." >&2
        transport="https"
      else
        URL="$SSH_URL"
      fi
      ;;
    *)
      transport="https"
      ;;
  esac
  [ "$transport" = "https" ] && URL="$HTTPS_URL"

  say "Cloning $URL into $DEST"
  git clone "$URL" "$DEST"
fi

# --- 5. Hand off to the stow bootstrap ---
printf 'Run the stow bootstrap now (--prefer-repo)? [Y/n] '
read -r ans
case "$ans" in
  n|N|no)
    echo
    echo "Next step:  cd ~/$REPO_NAME && ./bootstrap.sh"
    ;;
  *)
    say "Stowing $REPO_NAME onto \$HOME"
    exec "$DEST/bootstrap.sh" --prefer-repo
    ;;
esac
