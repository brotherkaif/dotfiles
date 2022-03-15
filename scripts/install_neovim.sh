#!/bin/bash
display_message () {
	echo -e "\e[43;30m $1 \e[0m"
}

install_neovim () {
	sudo rm /usr/bin/nvim
	sudo curl -L https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage -o '/usr/bin/nvim' && sudo chmod 0755 /usr/bin/nvim
}

display_message NEOVIM
install_neovim
