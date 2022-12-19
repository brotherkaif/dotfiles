#!/bin/sh
touch ~/RAN-CODESPACE-SCRIPT
cd $HOME

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

# Install neovim
wget -O /tmp/nvim.deb https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install /tmp/nvim.deb -y
rm /tmp/nvim.deb
