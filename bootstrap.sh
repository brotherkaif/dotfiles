#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Starting dotfiles bootstrap..."

# 1. Variables
DOTFILES_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/brotherkaif/dotfiles.git"
BRANCH="nix-conversion"
OS="$(uname -s)"

# 2. Ask for the host profile
echo "🖥️  Which machine profile are we building? (mac-mini, macbook-air, macbook-pro, thinkcentre, thinkpad)"
read -r HOST_PROFILE

# 3. macOS Specific Bootstrapping
if [ "$OS" = "Darwin" ]; then
    echo "🍎 macOS detected."

    # Install Xcode Command Line Tools if missing
    if ! xcode-select -p &> /dev/null; then
        echo "📦 Installing Xcode Command Line Tools..."
        xcode-select --install
        echo "⚠️  Please wait for the Xcode tools installation to finish, then run this script again."
        exit 0
    fi

    # Install Nix if missing
    if ! command -v nix &> /dev/null; then
        echo "❄️  Installing Nix (Determinate Systems)..."
        curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
        # Source nix into the current shell session
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    fi

# 4. NixOS Specific Bootstrapping
elif [ "$OS" = "Linux" ]; then
    # We assume if it's Linux, it's NixOS for your setup
    echo "🐧 Linux (NixOS) detected."
    # Nix is already installed natively on NixOS, so we skip installation.
else
    echo "❌ Unsupported OS: $OS"
    exit 1
fi

# 5. Clone the repository
if [ -d "$DOTFILES_DIR" ]; then
    echo "📂 Dotfiles directory already exists at $DOTFILES_DIR. Pulling latest..."
    cd "$DOTFILES_DIR"
    git pull origin "$BRANCH"
else
    echo "📥 Cloning dotfiles repository..."
    # We use nix shell to temporarily get git, in case the fresh machine doesn't have it yet
    nix --extra-experimental-features "nix-command flakes" shell nixpkgs#git -c git clone --branch "$BRANCH" "$REPO_URL" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# 6. Apply the Configuration
echo "⚙️  Applying Nix configuration for profile: $HOST_PROFILE..."

if [ "$OS" = "Darwin" ]; then
    # On a totally fresh Mac, `darwin-rebuild` doesn't exist yet.
    # We MUST run it via `nix run` for the very first time.
    sudo nix run nix-darwin -- switch --flake ".#$HOST_PROFILE"
elif [ "$OS" = "Linux" ]; then
    # On NixOS, we use nixos-rebuild with sudo
    sudo nixos-rebuild switch --flake ".#$HOST_PROFILE"
fi

echo "✅ Bootstrap complete! Please restart your terminal."
