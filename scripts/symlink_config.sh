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
		cd $HOME/.dotfiles/stow

		echo "┏┓ ┏━┓┏━┓╻ ╻"
		echo "┣┻┓┣━┫┗━┓┣━┫"
		echo "┗━┛╹ ╹┗━┛╹ ╹"
		# TODO: bash still not XDG compliant
		echo "Tidying up existing bash config..."
		rm -rf $HOME/.bash*
		echo "Symlinking bash..."
		stow -t $HOME bash		

		echo "╻ ╻╻┏┳┓"
		echo "┃┏┛┃┃┃┃"
		echo "┗┛ ╹╹ ╹"
		echo "Tidying up existing vim config..."
		rm -rf $HOME/.vim*
		rm -rf $XDG_CONFIG_HOME/vim
		rm -rf $XDG_DATA_HOME/vim/undo
		rm -rf $XDG_DATA_HOME/vim/swap
		rm -rf $XDG_DATA_HOME/vim/backup
		rm -rf $XDG_DATA_HOME/vim/view
		echo "Creating vim config directories..."
		mkdir -pv $XDG_CONFIG_HOME/vim
		mkdir -pv $XDG_DATA_HOME/vim/undo
		mkdir -pv $XDG_DATA_HOME/vim/swap
		mkdir -pv $XDG_DATA_HOME/vim/backup
		mkdir -pv $XDG_DATA_HOME/vim/view
		echo "Downloading vim-plug..."
		curl -fLo $XDG_DATA_HOME/vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		echo "Symlinking vim..."
		stow -t $HOME vim		

		# TODO: make pretty
		echo "Tidying up existing neovim config..."
		rm -rf $XDG_CONFIG_HOME/nvim
		echo "Creating neovim config directory..."
		mkdir -pv $XDG_CONFIG_HOME/nvim
		echo "Symlinking alacritty..."
		stow -t $HOME nvim	


		echo "╺┳╸┏┳┓╻ ╻╻ ╻"
		echo " ┃ ┃┃┃┃ ┃┏╋┛"
		echo " ╹ ╹ ╹┗━┛╹ ╹"
		echo "Tidying up existing tmux config..."
		rm -rf $HOME/.tmux*
		rm -rf $XDG_CONFIG_HOME/tmux
		echo "Creating tmux config directory..."
		mkdir -pv $XDG_CONFIG_HOME/tmux/plugins/tpm
		echo "Downloading tmux plugin manager..."
		git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm
		echo "Symlinking tmux..."
		stow -t $HOME tmux	

		echo "┏━┓╻  ┏━┓┏━╸┏━┓╻╺┳╸╺┳╸╻ ╻"
		echo "┣━┫┃  ┣━┫┃  ┣┳┛┃ ┃  ┃ ┗┳┛"
		echo "╹ ╹┗━╸╹ ╹┗━╸╹┗╸╹ ╹  ╹  ╹ "
		echo "Tidying up existing alacritty config..."
		rm -rf $XDG_CONFIG_HOME/alacritty
		echo "Creating alacritty config directory..."
		mkdir $XDG_CONFIG_HOME/alacritty
		echo "Symlinking alacritty..."
		stow -t $HOME alacritty	

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
