#!/bin/bash
# Import detectOS
. ./detect-os.sh

echo "INSTALL NEOVIM"
# https://github.com/neovim/neovim/wiki/Installing-Neovim

case $(detectOS) in
    "debian" | "fedora" | "codespaces")
				echo "Linux detected. Installing..."

				curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

				rm -rf $HOME/.local/share/nvim
				mkdir -p $HOME/.local/bin
				mv nvim.appimage $HOME/.local/bin/nvim

				chmod u+x $HOME/.local/bin/nvim
				;;
    "darwin")
				rm -rf $HOME/.local/share/nvim
				brew install neovim
				;;
    *)
				echo "Could not detect OS! Skipping."
				echo "Value recieved: $(detectOS)"
				;;
esac
