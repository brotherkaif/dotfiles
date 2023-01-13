#!/bin/sh
isDotfilesRepo() {
    if [[ -f /etc/os-release ]] && [[ -d /workspaces/dotfiles ]]; then
        return true
    fi

    return false
}

touch ~/RAN-CODESPACE-SCRIPT
cd $HOME

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

# Install neovim
rm $HOME/.local/bin/nvim
rm $HOME/.config/nvim
wget -O /tmp/nvim.deb https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install /tmp/nvim.deb -y
rm /tmp/nvim.deb
