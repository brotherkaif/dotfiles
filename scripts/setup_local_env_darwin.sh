#!/usr/bin/env bash
echo -e "\e[43;30m S E T U P \e[0m"

install_darwin_packages () {
	echo "This utility will install tools for Darwin."
	echo "WARNING: DO NOT run as root!"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		# ---------------------------------------------
		# Setup
		# ---------------------------------------------
		echo -e "\e[43;30m SETUP \e[0m"

		# Install homebrew if it is not installed
		which brew 1>&/dev/null
		if [ ! "$?" -eq 0 ] ; then
			echo "Homebrew not installed. Attempting to install Homebrew"
			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
			if [ ! "$?" -eq 0 ] ; then
				echo "Something went wrong. Exiting..." && exit 1
			fi
		fi

		# Make sure we’re using the latest Homebrew
		echo -e "\e[43;30m update \e[0m"
		brew update

		# Upgrade any already-installed formulae
		echo -e "\e[43;30m upgrade \e[0m"
		brew upgrade

		# Core Utils
		echo -e "\e[43;30m core utils \e[0m"
		brew install coreutils

		# ---------------------------------------------
		# Programming Languages and Frameworks
		# ---------------------------------------------
		echo -e "\e[43;30m FRAMEWORKS \e[0m"

		# node
		echo -e "\e[43;30m node \e[0m"
		brew install node

		# ---------------------------------------------
		# Tools
		# ---------------------------------------------
		echo -e "\e[43;30m TOOLS \e[0m"

		# stow
		echo -e "\e[43;30m stow \e[0m"
		brew install stow

		# tree
		echo -e "\e[43;30m tree \e[0m"
		brew install tree

		# htop
		echo -e "\e[43;30m htop \e[0m"
		brew install htop

		# git
		echo -e "\e[43;30m git \e[0m"
		echo "skipping: git already installed on darwin"

		# tmux
		echo -e "\e[43;30m tmux \e[0m"
		brew install tmux

		# ffmpeg
		echo -e "\e[43;30m ffmpeg \e[0m"
		brew install ffmpeg

		# ---------------------------------------------
		# Applications
		# ---------------------------------------------
		echo -e "\e[43;30m APPLICATIONS \e[0m"

		# neovim
		echo -e "\e[43;30m neovim \e[0m"
		brew install neovim

		# github cli
		echo -e "\e[43;30m github cli \e[0m"
		brew install gh

		# docker
		echo -e "\e[43;30m docker \e[0m"
		brew install docker

		# vscode
		echo -e "\e[43;30m vs-code \e[0m"
		brew cask install visual-studio-code
		code --install-extension Shan.code-settings-sync

		# ---------------------------------------------
		# Stupid Terminal Nonsense
		# ---------------------------------------------
		echo -e "\e[43;30m NONSENSE \e[0m"

		# figlet
		echo -e "\e[43;30m figlet \e[0m"
		brew install figlet

		# toilet
		echo -e "\e[43;30m toilet \e[0m"
		brew install toilet

		# ---------------------------------------------
		# Cleanup
		# ---------------------------------------------
		echo -e "\e[43;30m CLEANUP \e[0m"

		# Remove outdated versions from the cellar
		echo -e "\e[43;30m cache \e[0m"
		brew cleanup
	else
		echo "INSTALLATION CANCELLED"
	fi
}

install_darwin_packages
