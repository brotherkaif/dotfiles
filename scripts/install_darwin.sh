#!/usr/bin/env bash
echo "┌──────────────────────────────────┐"
echo "│▜▘▙ ▌▞▀▖▀▛▘▞▀▖▌  ▌  ▞▀▖▀▛▘▜▘▞▀▖▙ ▌│"
echo "│▐ ▌▌▌▚▄  ▌ ▙▄▌▌  ▌  ▙▄▌ ▌ ▐ ▌ ▌▌▌▌│"
echo "│▐ ▌▝▌▖ ▌ ▌ ▌ ▌▌  ▌  ▌ ▌ ▌ ▐ ▌ ▌▌▝▌│"
echo "│▀▘▘ ▘▝▀  ▘ ▘ ▘▀▀▘▀▀▘▘ ▘ ▘ ▀▘▝▀ ▘ ▘│"
echo "└──────────────────────────────────┘"

install_darwin () {
	echo "This utility will install tools for Darwin."
	echo "WARNING: DO NOT run as root!"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		# ---------------------------------------------
		# Setup
		# ---------------------------------------------
		echo "┏━┓┏━╸╺┳╸╻ ╻┏━┓"
		echo "┗━┓┣╸  ┃ ┃ ┃┣━┛"
		echo "┗━┛┗━╸ ╹ ┗━┛╹  "

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
		echo " ⡀⢀ ⣀⡀ ⢀⣸ ⢀⣀ ⣰⡀ ⢀⡀"
		echo " ⠣⠼ ⡧⠜ ⠣⠼ ⠣⠼ ⠘⠤ ⠣⠭"
		brew update

		# Upgrade any already-installed formulae
		echo " ⡀⢀ ⣀⡀ ⢀⡀ ⡀⣀ ⢀⣀ ⢀⣸ ⢀⡀"
		echo " ⠣⠼ ⡧⠜ ⣑⡺ ⠏  ⠣⠼ ⠣⠼ ⠣⠭"
		brew upgrade

		# Core Utils
		brew install coreutils

		# install zsh
		echo " ⣀⣀ ⢀⣀ ⣇⡀"
		echo " ⠴⠥ ⠭⠕ ⠇⠸"
		# brew install zsh
		chsh -s /bin/zsh

		# install oh-my-zsh
		echo "⢀⡀ ⣇⡀   ⣀⣀  ⡀⢀   ⣀⣀ ⢀⣀ ⣇⡀"
		echo "⠣⠜ ⠇⠸   ⠇⠇⠇ ⣑⡺   ⠴⠥ ⠭⠕ ⠇⠸"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

		# ---------------------------------------------
		# Programming Languages and Frameworks
		# ---------------------------------------------
		echo "┏━╸┏━┓┏━┓┏┳┓┏━╸╻ ╻┏━┓┏━┓╻┏ ┏━┓"
		echo "┣╸ ┣┳┛┣━┫┃┃┃┣╸ ┃╻┃┃ ┃┣┳┛┣┻┓┗━┓"
		echo "╹  ╹┗╸╹ ╹╹ ╹┗━╸┗┻┛┗━┛╹┗╸╹ ╹┗━┛"

		# node
		echo " ⣀⡀ ⢀⡀ ⢀⣸ ⢀⡀"
		echo " ⠇⠸ ⠣⠜ ⠣⠼ ⠣⠭"
		brew install node

		# ---------------------------------------------
		# Tools
		# ---------------------------------------------
		echo "╺┳╸┏━┓┏━┓╻  ┏━┓"
		echo " ┃ ┃ ┃┃ ┃┃  ┗━┓"
		echo " ╹ ┗━┛┗━┛┗━╸┗━┛"

		# stow
		echo "⢀⣀ ⣰⡀ ⢀⡀ ⡀ ⢀"
		echo "⠭⠕ ⠘⠤ ⠣⠜ ⠱⠱⠃"
		brew install stow

		# tree
		echo " ⣰⡀ ⡀⣀ ⢀⡀ ⢀⡀"
		echo " ⠘⠤ ⠏  ⠣⠭ ⠣⠭"
		brew install tree

		# htop
		echo " ⣇⡀ ⣰⡀ ⢀⡀ ⣀⡀"
		echo " ⠇⠸ ⠘⠤ ⠣⠜ ⡧⠜"
		brew install htop

		# git
		echo " ⢀⡀ ⠄ ⣰⡀"
		echo " ⣑⡺ ⠇ ⠘⠤"
		echo "skipping: git already installed on darwin"

		# tmux
		echo " ⣰⡀ ⣀⣀  ⡀⢀ ⡀⢀"
		echo " ⠘⠤ ⠇⠇⠇ ⠣⠼ ⠜⠣"
		brew install tmux

		# nnn
		echo "⣀⡀ ⣀⡀ ⣀⡀"
		echo "⠇⠸ ⠇⠸ ⠇⠸"
		brew install nnn

		# neovim
		echo " ⣀⡀ ⢀⡀ ⢀⡀ ⡀⢀ ⠄ ⣀⣀ "
		echo " ⠇⠸ ⠣⠭ ⠣⠜ ⠱⠃ ⠇ ⠇⠇⠇"
		brew install neovim

		# ---------------------------------------------
		# Applications
		# ---------------------------------------------
		echo "┏━┓┏━┓┏━┓╻  ╻┏━╸┏━┓╺┳╸╻┏━┓┏┓╻┏━┓"
		echo "┣━┫┣━┛┣━┛┃  ┃┃  ┣━┫ ┃ ┃┃ ┃┃┗┫┗━┓"
		echo "╹ ╹╹  ╹  ┗━╸╹┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹┗━┛"

		# docker
		echo " ⢀⣸ ⢀⡀ ⢀⣀ ⡇⡠ ⢀⡀ ⡀⣀"
		echo " ⠣⠼ ⠣⠜ ⠣⠤ ⠏⠢ ⠣⠭ ⠏ "
		brew install docker

		# vscode
		echo " ⡀⢀ ⢀⣀    ⢀⣀ ⢀⡀ ⢀⣸ ⢀⡀"
		echo " ⠱⠃ ⠭⠕ ⠉⠉ ⠣⠤ ⠣⠜ ⠣⠼ ⠣⠭"
		brew cask install visual-studio-code
		code --install-extension Shan.code-settings-sync

		# ---------------------------------------------
		# Stupid Terminal Nonsense
		# ---------------------------------------------
		echo "┏┓╻┏━┓┏┓╻┏━┓┏━╸┏┓╻┏━┓┏━╸"
		echo "┃┗┫┃ ┃┃┗┫┗━┓┣╸ ┃┗┫┗━┓┣╸ "
		echo "╹ ╹┗━┛╹ ╹┗━┛┗━╸╹ ╹┗━┛┗━╸"

		# figlet
		echo " ⣰⡁ ⠄ ⢀⡀ ⡇ ⢀⡀ ⣰⡀"
		echo " ⢸  ⠇ ⣑⡺ ⠣ ⠣⠭ ⠘⠤"
		brew install figlet

		# toilet
		echo " ⣰⡀ ⢀⡀ ⠄ ⡇ ⢀⡀ ⣰⡀"
		echo " ⠘⠤ ⠣⠜ ⠇ ⠣ ⠣⠭ ⠘⠤"
		brew install toilet

		# mplayer
		echo " ⣀⣀  ⣀⡀ ⡇ ⢀⣀ ⡀⢀ ⢀⡀ ⡀⣀"
		echo " ⠇⠇⠇ ⡧⠜ ⠣ ⠣⠼ ⣑⡺ ⠣⠭ ⠏ "
		brew install mplayer

		# cool-retro-term
		echo " ⢀⣀ ⢀⡀ ⢀⡀ ⡇    ⡀⣀ ⢀⡀ ⣰⡀ ⡀⣀ ⢀⡀    ⣰⡀ ⢀⡀ ⡀⣀ ⣀⣀ "
		echo " ⠣⠤ ⠣⠜ ⠣⠜ ⠣ ⠉⠉ ⠏  ⠣⠭ ⠘⠤ ⠏  ⠣⠜ ⠉⠉ ⠘⠤ ⠣⠭ ⠏  ⠇⠇⠇"
		brew cask install cool-retro-term

		# ---------------------------------------------
		# Cleanup
		# ---------------------------------------------
		echo "┏━╸╻  ┏━╸┏━┓┏┓╻╻ ╻┏━┓"
		echo "┃  ┃  ┣╸ ┣━┫┃┗┫┃ ┃┣━┛"
		echo "┗━╸┗━╸┗━╸╹ ╹╹ ╹┗━┛╹  "

		# Remove outdated versions from the cellar
		echo " ⢀⣀ ⢀⣀ ⢀⣀ ⣇⡀ ⢀⡀"
		echo " ⠣⠤ ⠣⠼ ⠣⠤ ⠇⠸ ⠣⠭"
		brew cleanup
	else
		echo "INSTALLATION CANCELLED"
	fi
}

install_darwin
