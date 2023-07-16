#!/bin/bash

# Import detectOS
. ./detect-os.sh

echo "INSTALL NEOVIM"
# https://github.com/neovim/neovim/wiki/Installing-Neovim

case $(detectOS) in
"debian")
	echo "Linux detected. Installing..."

	# install dependencies
	sudo apt install build-essential
	sudo apt install ripgrep
	sudo apt install fd-find

	# install neovim appimage
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

	# move bin
	mkdir -p $HOME/.local/bin
	mv nvim.appimage $HOME/.local/bin/nvim

	# make executable
	chmod u+x $HOME/.local/bin/nvim

	# clean up existing nvim config
	rm -rf $HOME/.local/share/nvim
	rm -rf $HOME/.local/state/nvim
	rm -rf $HOME/.cache/nvim
	;;
"fedora" | "codespaces")
	# install neovim appimage
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

	# move bin
	mkdir -p $HOME/.local/bin
	mv nvim.appimage $HOME/.local/bin/nvim

	# make executable
	chmod u+x $HOME/.local/bin/nvim

	# clean up existing nvim config
	rm -rf $HOME/.local/share/nvim
	rm -rf $HOME/.local/state/nvim
	rm -rf $HOME/.cache/nvim
	;;
"darwin")
	echo "Darwin detected. Installing..."

	rm -rf $HOME/.local/share/nvim
	rm -rf $HOME/.local/state/nvim
	rm -rf $HOME/.cache/nvim

	brew install neovim
	;;
*)
	echo "Could not detect OS! Skipping."
	echo "Value recieved: $(detectOS)"
	;;
esac
