#!/bin/bash
echo "┌────────────────────────────┐"
echo "│▞▀▖▌ ▌▙▗▌▌  ▜▘▙ ▌▌ ▌▜▘▙ ▌▞▀▖│"
echo "│▚▄ ▝▞ ▌▘▌▌  ▐ ▌▌▌▙▞ ▐ ▌▌▌▌▄▖│"
echo "│▖ ▌ ▌ ▌ ▌▌  ▐ ▌▝▌▌▝▖▐ ▌▝▌▌ ▌│"
echo "│▝▀  ▘ ▘ ▘▀▀▘▀▘▘ ▘▘ ▘▀▘▘ ▘▝▀ │"
echo "└────────────────────────────┘"

symlink_files () {
	echo "This script will symlink your config files."
	echo "WARNING: DO NOT run as root!"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		echo "BEGINNING SYMLINKING"

		echo "┏┓ ┏━┓┏━┓╻ ╻"
		echo "┣┻┓┣━┫┗━┓┣━┫"
		echo "┗━┛╹ ╹┗━┛╹ ╹"
		# TODO: bash still not XDG compliant
		echo "Tidying up existing bash config..."
		rm "$HOME/.bashrc"
		echo "Symlinking bash..."
		ln -sv "$PWD/.config/bash/.bashrc" "$HOME/.bashrc"
		ln -sv "$PWD/.config/bash/.bash_profile" "$HOME/.bashrc_profile"
		echo "...done!"

		echo "╻ ╻╻┏┳┓"
		echo "┃┏┛┃┃┃┃"
		echo "┗┛ ╹╹ ╹"
		echo "Tidying up existing vim config..."
		rm -rf "$HOME/.vim*"
		rm -rf "$XDG_CONFIG_HOME/vim"
		echo "Symlinking vim..."
		mkdir "$XDG_CONFIG_HOME/vim"
		ln -sv "$PWD/.config/vim/" "$XDG_CONFIG_HOME/vim/"
		echo "Downloading vim-plug..."
		curl -fLo $XDG_CONFIG_HOME/vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		echo "...done!"

		echo "┏┓╻┏━╸┏━┓╻ ╻╻┏┳┓"
		echo "┃┗┫┣╸ ┃ ┃┃┏┛┃┃┃┃"
		echo "╹ ╹┗━╸┗━┛┗┛ ╹╹ ╹"
		echo "Creating neovim config directory..."
		mkdir $HOME/.config/nvim
		# TODO: vim-plug location should be XDG compliant
		echo "Downloading vim-plug..."
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		echo "Symlinking neovim..."
		ln -sv "$PWD/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
		echo "...done!"

		echo "╺┳╸┏┳┓╻ ╻╻ ╻"
		echo " ┃ ┃┃┃┃ ┃┏╋┛"
		echo " ╹ ╹ ╹┗━┛╹ ╹"
		echo "Tidying up existing tmux config..."
		rm "$HOME/.tmux.conf"
		rm -rf "$HOME/.tmux"
		rm -rf "$HOME/.config/tmux"
		echo "Creating tmux config directory..."
		mkdir -p $HOME/.config/tmux/plugins/tpm
		echo "Downloading tmux plugin manager..."
		git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
		echo "Symlinking tmux..."
		ln -sv "$PWD/.config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
		echo "...done!"

		echo "┏━┓╻  ┏━┓┏━╸┏━┓╻╺┳╸╺┳╸╻ ╻"
		echo "┣━┫┃  ┣━┫┃  ┣┳┛┃ ┃  ┃ ┗┳┛"
		echo "╹ ╹┗━╸╹ ╹┗━╸╹┗╸╹ ╹  ╹  ╹ "
		echo "Creating alacritty config directory..."
		mkdir $HOME/.config/alacritty
		echo "Symlinking alacritty..."
		ln -sv "$PWD/.config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

		echo "┏┓╻╻ ╻┏┳┓"
		echo "┃┗┫┃┏┛┃┃┃"
		echo "╹ ╹┗┛ ╹ ╹"
		echo "Setting up nvm..."
		wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
		echo "...done!"
	else
		echo "SYMLINKING CANCELLED"
	fi
}

symlink_files
