#!/bin/bash
echo -e "\e[43;30m S Y M L I N K I N G \e[0m"

symlink_files () {
	echo "This script will symlink your config files."
	echo "WARNING: DO NOT run as root!"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		cd $HOME/.dotfiles/stow

		echo -e "\e[43;30m bash \e[0m"
		echo "Tidying up existing bash config..."
		rm -rf $HOME/.bash*
		echo "Symlinking bash..."
		stow -t $HOME --no-folding bash
		echo "...done!"

		echo -e "\e[43;30m zsh \e[0m"
		echo "Tidying up existing zsh config..."
		rm -rf $HOME/.zsh*
		echo "Symlinking zsh..."
		stow -t $HOME --no-folding zsh
		echo "...done!"

		echo -e "\e[43;30m vim \e[0m"
		echo "Tidying up existing vim config..."
		rm -rf $HOME/.vim*
		echo "Symlinking vim..."
		stow -t $HOME --no-folding vim
		echo "...done!"

		echo -e "\e[43;30m neovim \e[0m"
		echo "Tidying up existing neovim config..."
		rm -rf $XDG_CONFIG_HOME/nvim
		echo "Symlinking neovim..."
		stow -t $HOME --no-folding nvim
		echo "...done!"

		echo -e "\e[43;30m tmux \e[0m"
		echo "Tidying up existing tmux config..."
		rm -rf $HOME/.tmux*
		rm -rf $XDG_CONFIG_HOME/tmux
		echo "Symlinking tmux..."
		stow -t $HOME --no-folding tmux
		echo "...done!"

		echo -e "\e[43;30m gcs \e[0m"
		echo "Tidying up existing gcs config..."
		rm -rf $HOME/.customize_environment*
		echo "Symlinking gcs..."
		stow -t $HOME --no-folding gcs
		echo "...done!"
	else
		echo "SYMLINKING CANCELLED"
	fi
}

symlink_files
