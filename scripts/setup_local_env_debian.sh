#!/bin/bash
echo -e "\e[43;30m S E T U P \e[0m"

install_debian_packages () {
	echo "This script will setup a LOCAL environment for debian."
	echo "WARNING: DO NOT run as root!"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		# ---------------------------------------------
		# Setup
		# ---------------------------------------------
		echo -e "\e[43;30m SETUP \e[0m"

		# update apt
		echo -e "\e[43;30m update \e[0m"
		sudo apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com
		sudo apt update -y

		# upgrade any preinstalled packages
		echo -e "\e[43;30m upgrade \e[0m"
		sudo apt upgrade -y

		# clone git prompt
		mkdir ~/.apps/git-prompt 
		git clone https://github.com/magicmonty/bash-git-prompt.git ~/.apps/git-prompt/bash --depth=1
		git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.apps/git-prompt/zsh --depth=1

		# ---------------------------------------------
		# Programming Languages and Frameworks
		# ---------------------------------------------
		echo -e "\e[43;30m FRAMEWORKS \e[0m"

		# node
		echo -e "\e[43;30m node \e[0m"
		wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

		# ---------------------------------------------
		# Tools
		# ---------------------------------------------
		echo -e "\e[43;30m TOOLS \e[0m"

		# pass
		echo -e "\e[43;30m pass \e[0m"
		sudo apt install pass -y

		# stow
		echo -e "\e[43;30m stow \e[0m"
		sudo apt install stow -y

		# tree
		echo -e "\e[43;30m tree \e[0m"
		sudo apt install tree -y

		# htop
		echo -e "\e[43;30m htop \e[0m"
		sudo apt install htop -y

		# git
		echo -e "\e[43;30m git \e[0m"
		sudo apt install git -y

		# tmux
		echo -e "\e[43;30m tmux \e[0m"
		sudo apt install tmux -y

		# ffmpeg
		echo -e "\e[43;30m ffmpeg \e[0m"
		sudo apt install ffmpeg -y

		# ---------------------------------------------
		# Applications
		# ---------------------------------------------
		echo -e "\e[43;30m APPLICATIONS \e[0m"

		# vim
		echo -e "\e[43;30m vim \e[0m"
		mkdir $HOME/apps/vim
		cd $HOME/.apps/vim
		curl -LO https://github.com/vim/vim-appimage/releases/download/v8.2.1145/GVim-v8.2.1145.glibc2.15-x86_64.AppImage
		mv GVim-v8.2.1145.glibc2.15-x86_64.AppImage vim.appimage
		chmod u+x vim.appimage

		# neovim
		echo -e "\e[43;30m neovim \e[0m"
		mkdir $HOME/.apps/nvim
		cd $HOME/.apps/nvim
		curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
		chmod u+x nvim.appimage

		# docker
		echo -e "\e[43;30m docker \e[0m"
		sudo apt install docker -y
		# verify the installaiton
		docker run hello-world

		# docker compose
		echo -e "\e[43;30m docker compose \e[0m"
		sudo apt install docker-compose -y

		# brave
		echo -e "\e[43;30m brave \e[0m"
		sudo apt update
		sudo apt install apt-transport-https curl
		curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
		echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
		sudo apt update
		sudo apt install brave-browser

		# ---------------------------------------------
		# Stupid Terminal Nonsense
		# ---------------------------------------------
		echo -e "\e[43;30m NONSENSE \e[0m"

		# figlet
		echo -e "\e[43;30m figlet \e[0m"
		sudo apt install figlet -y

		# toilet
		echo -e "\e[43;30m toilet \e[0m"
		sudo apt install toilet -y

		# ---------------------------------------------
		# Cleanup
		# ---------------------------------------------
		echo -e "\e[43;30m CLEANUP \e[0m"

		# cleanup the cache
		echo -e "\e[43;30m cache \e[0m"
		sudo apt clean
	else
		echo "INSTALLATION CANCELLED"
	fi
}

install_debian_packages
