#!/bin/bash
# Install neovim
mkdir $HOME/.local/bin
curl -Lo $HOME/.local/bin/nvim  https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x $HOME/.local/bin/nvim
