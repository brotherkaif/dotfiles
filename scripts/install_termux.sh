#!/usr/bin/env bash
echo "┌──────────────────────────────────┐"
echo "│▜▘▙ ▌▞▀▖▀▛▘▞▀▖▌  ▌  ▞▀▖▀▛▘▜▘▞▀▖▙ ▌│"
echo "│▐ ▌▌▌▚▄  ▌ ▙▄▌▌  ▌  ▙▄▌ ▌ ▐ ▌ ▌▌▌▌│"
echo "│▐ ▌▝▌▖ ▌ ▌ ▌ ▌▌  ▌  ▌ ▌ ▌ ▐ ▌ ▌▌▝▌│"
echo "│▀▘▘ ▘▝▀  ▘ ▘ ▘▀▀▘▀▀▘▘ ▘ ▘ ▀▘▝▀ ▘ ▘│"
echo "└──────────────────────────────────┘"

install_darwin () {
	echo "This utility will install tools for Termux."
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

		# Upgrade any already-installed packages
		echo " ⡀⢀ ⣀⡀ ⢀⡀ ⡀⣀ ⢀⣀ ⢀⣸ ⢀⡀"
		echo " ⠣⠼ ⡧⠜ ⣑⡺ ⠏  ⠣⠼ ⠣⠼ ⠣⠭"
		pkg upgrade

		# install zsh
		echo " ⣀⣀ ⢀⣀ ⣇⡀"
		echo " ⠴⠥ ⠭⠕ ⠇⠸"
		pkg install zsh
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
		echo "skipping: nvm installed as part of symlinking script"

		# ---------------------------------------------
		# Tools
		# ---------------------------------------------
		echo "╺┳╸┏━┓┏━┓╻  ┏━┓"
		echo " ┃ ┃ ┃┃ ┃┃  ┗━┓"
		echo " ╹ ┗━┛┗━┛┗━╸┗━┛"

		# stow
		echo "⢀⣀ ⣰⡀ ⢀⡀ ⡀ ⢀"
		echo "⠭⠕ ⠘⠤ ⠣⠜ ⠱⠱⠃"
		pkg install stow

		# tree
		echo " ⣰⡀ ⡀⣀ ⢀⡀ ⢀⡀"
		echo " ⠘⠤ ⠏  ⠣⠭ ⠣⠭"
		brew install tree

		# htop
		echo " ⣇⡀ ⣰⡀ ⢀⡀ ⣀⡀"
		echo " ⠇⠸ ⠘⠤ ⠣⠜ ⡧⠜"
		pkg install htop

		# git
		echo " ⢀⡀ ⠄ ⣰⡀"
		echo " ⣑⡺ ⠇ ⠘⠤"
		pkg install git

		# tmux
		echo " ⣰⡀ ⣀⣀  ⡀⢀ ⡀⢀"
		echo " ⠘⠤ ⠇⠇⠇ ⠣⠼ ⠜⠣"
		pkg install tmux

		# nnn
		echo "⣀⡀ ⣀⡀ ⣀⡀"
		echo "⠇⠸ ⠇⠸ ⠇⠸"
		pkg install nnn

		# neovim
		echo " ⣀⡀ ⢀⡀ ⢀⡀ ⡀⢀ ⠄ ⣀⣀ "
		echo " ⠇⠸ ⠣⠭ ⠣⠜ ⠱⠃ ⠇ ⠇⠇⠇"
		pkg install neovim

		# irssi
		echo " ⠄ ⡀⣀ ⢀⣀ ⢀⣀ ⠄"
		echo " ⠇ ⠏  ⠭⠕ ⠭⠕ ⠇"
		pkg install irssi

		# newsboat
		echo "⣀⡀ ⢀⡀ ⡀ ⢀ ⢀⣀ ⣇⡀ ⢀⡀ ⢀⣀ ⣰⡀"
		echo "⠇⠸ ⠣⠭ ⠱⠱⠃ ⠭⠕ ⠧⠜ ⠣⠜ ⠣⠼ ⠘⠤"
		pkg install newsboat

		# lynx
		echo "⡇ ⡀⢀ ⣀⡀ ⡀⢀"
		echo "⠣ ⣑⡺ ⠇⠸ ⠜⠣"
		pkg install lynx

		# ---------------------------------------------
		# Stupid Terminal Nonsense
		# ---------------------------------------------
		echo "┏┓╻┏━┓┏┓╻┏━┓┏━╸┏┓╻┏━┓┏━╸"
		echo "┃┗┫┃ ┃┃┗┫┗━┓┣╸ ┃┗┫┗━┓┣╸ "
		echo "╹ ╹┗━┛╹ ╹┗━┛┗━╸╹ ╹┗━┛┗━╸"

		# figlet
		echo " ⣰⡁ ⠄ ⢀⡀ ⡇ ⢀⡀ ⣰⡀"
		echo " ⢸  ⠇ ⣑⡺ ⠣ ⠣⠭ ⠘⠤"
		pkg install figlet

		# toilet
		echo " ⣰⡀ ⢀⡀ ⠄ ⡇ ⢀⡀ ⣰⡀"
		echo " ⠘⠤ ⠣⠜ ⠇ ⠣ ⠣⠭ ⠘⠤"
		pkg install toilet
	else
		echo "INSTALLATION CANCELLED"
	fi
}

install_darwin
