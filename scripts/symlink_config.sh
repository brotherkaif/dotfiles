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
		stow -t $HOME --no-folding bash

		echo "┏┓╻┏━╸┏━┓╻ ╻╻┏┳┓"
		echo "┃┗┫┣╸ ┃ ┃┃┏┛┃┃┃┃"
		echo "╹ ╹┗━╸┗━┛┗┛ ╹╹ ╹"
		echo "Tidying up existing neovim config..."
		rm -rf $XDG_CONFIG_HOME/nvim
		echo "Symlinking alacritty..."
		stow -t $HOME --no-folding nvim

		echo "╺┳╸┏┳┓╻ ╻╻ ╻"
		echo " ┃ ┃┃┃┃ ┃┏╋┛"
		echo " ╹ ╹ ╹┗━┛╹ ╹"
		echo "Tidying up existing tmux config..."
		rm -rf $HOME/.tmux*
		rm -rf $XDG_CONFIG_HOME/tmux
		echo "Symlinking tmux..."
		stow -t $HOME --no-folding tmux
		echo "Creating tmux plugin directory..."
		mkdir -pv $XDG_CONFIG_HOME/tmux/plugins/tpm
		echo "Downloading tmux plugin manager..."
		git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm

		echo "╻┏━┓┏━┓┏━┓╻"
		echo "┃┣┳┛┗━┓┗━┓┃"
		echo "╹╹┗╸┗━┛┗━┛╹"
		echo "Tidying up existing irssi config..."
		rm -rf $HOME/.irssi
		rm -rf $XDG_CONFIG_HOME/irssi
		echo "Symlinking irssi..."
		stow -t $HOME --no-folding irssi

		echo "┏━┓╻  ┏━┓┏━╸┏━┓╻╺┳╸╺┳╸╻ ╻"
		echo "┣━┫┃  ┣━┫┃  ┣┳┛┃ ┃  ┃ ┗┳┛"
		echo "╹ ╹┗━╸╹ ╹┗━╸╹┗╸╹ ╹  ╹  ╹ "
		echo "Tidying up existing alacritty config..."
		rm -rf $XDG_CONFIG_HOME/alacritty
		echo "Symlinking alacritty..."
		stow -t $HOME --no-folding alacritty

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
