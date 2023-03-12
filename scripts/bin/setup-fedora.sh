#!/bin/sh
cd $HOME

# Install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
mv nvim.appimage /var/home/brotherkaif/.local/bin/nvim
chmod u+x /var/home/brotherkaif/.local/bin/nvim
