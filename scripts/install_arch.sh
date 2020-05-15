#!/usr/bin/env bash
echo "┌──────────────────────────────────┐"
echo "│▜▘▙ ▌▞▀▖▀▛▘▞▀▖▌  ▌  ▞▀▖▀▛▘▜▘▞▀▖▙ ▌│"
echo "│▐ ▌▌▌▚▄  ▌ ▙▄▌▌  ▌  ▙▄▌ ▌ ▐ ▌ ▌▌▌▌│"
echo "│▐ ▌▝▌▖ ▌ ▌ ▌ ▌▌  ▌  ▌ ▌ ▌ ▐ ▌ ▌▌▝▌│"
echo "│▀▘▘ ▘▝▀  ▘ ▘ ▘▀▀▘▀▀▘▘ ▘ ▘ ▀▘▝▀ ▘ ▘│"
echo "└──────────────────────────────────┘"

install_arch () {
	echo "This utility will install tools for Arch."
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

		# Update repos and upgrade packages
		echo " ⡀⢀ ⣀⡀ ⢀⣸ ⢀⣀ ⣰⡀ ⢀⡀"
		echo " ⠣⠼ ⡧⠜ ⠣⠼ ⠣⠼ ⠘⠤ ⠣⠭"
		sudo pacman -Syu

		# Install yay (for AUR support)
		sudo pacman -S yay

		# install zsh
		echo " ⣀⣀ ⢀⣀ ⣇⡀"
		echo " ⠴⠥ ⠭⠕ ⠇⠸"
		sudo pacman -S zsh
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
		sudo pacman -S stow

		# tree
		echo " ⣰⡀ ⡀⣀ ⢀⡀ ⢀⡀"
		echo " ⠘⠤ ⠏  ⠣⠭ ⠣⠭"
		sudo pacman -S tree

		# htop
		echo " ⣇⡀ ⣰⡀ ⢀⡀ ⣀⡀"
		echo " ⠇⠸ ⠘⠤ ⠣⠜ ⡧⠜"
		sudo pacman -S htop

		# git
		echo " ⢀⡀ ⠄ ⣰⡀"
		echo " ⣑⡺ ⠇ ⠘⠤"
		sudo pacman -S git

		# tmux
		echo " ⣰⡀ ⣀⣀  ⡀⢀ ⡀⢀"
		echo " ⠘⠤ ⠇⠇⠇ ⠣⠼ ⠜⠣"
		sudo pacman -S tmux

		# nnn
		echo "⣀⡀ ⣀⡀ ⣀⡀"
		echo "⠇⠸ ⠇⠸ ⠇⠸"
		sudo pacman -S nnn

		# neovim
		echo " ⣀⡀ ⢀⡀ ⢀⡀ ⡀⢀ ⠄ ⣀⣀ "
		echo " ⠇⠸ ⠣⠭ ⠣⠜ ⠱⠃ ⠇ ⠇⠇⠇"
		sudo pacman -S neovim

		# irssi
		echo " ⠄ ⡀⣀ ⢀⣀ ⢀⣀ ⠄"
		echo " ⠇ ⠏  ⠭⠕ ⠭⠕ ⠇"
		sudo pacman -S irssi

		# ---------------------------------------------
		# Applications
		# ---------------------------------------------
		echo "┏━┓┏━┓┏━┓╻  ╻┏━╸┏━┓╺┳╸╻┏━┓┏┓╻┏━┓"
		echo "┣━┫┣━┛┣━┛┃  ┃┃  ┣━┫ ┃ ┃┃ ┃┃┗┫┗━┓"
		echo "╹ ╹╹  ╹  ┗━╸╹┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹┗━┛"

		# docker
		echo " ⢀⣸ ⢀⡀ ⢀⣀ ⡇⡠ ⢀⡀ ⡀⣀"
		echo " ⠣⠼ ⠣⠜ ⠣⠤ ⠏⠢ ⠣⠭ ⠏ "
		sudo pacman -S docker

		# vscode
		echo " ⡀⢀ ⢀⣀    ⢀⣀ ⢀⡀ ⢀⣸ ⢀⡀"
		echo " ⠱⠃ ⠭⠕ ⠉⠉ ⠣⠤ ⠣⠜ ⠣⠼ ⠣⠭"
		yay -S visual-studio-code-bin
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
		sudo pacman -S figlet

		# toilet
		echo " ⣰⡀ ⢀⡀ ⠄ ⡇ ⢀⡀ ⣰⡀"
		echo " ⠘⠤ ⠣⠜ ⠇ ⠣ ⠣⠭ ⠘⠤"
		yay -S toilet

		# mplayer
		echo " ⣀⣀  ⣀⡀ ⡇ ⢀⣀ ⡀⢀ ⢀⡀ ⡀⣀"
		echo " ⠇⠇⠇ ⡧⠜ ⠣ ⠣⠼ ⣑⡺ ⠣⠭ ⠏ "
		sudo pacman -S mplayer

		# cool-retro-term
		echo " ⢀⣀ ⢀⡀ ⢀⡀ ⡇    ⡀⣀ ⢀⡀ ⣰⡀ ⡀⣀ ⢀⡀    ⣰⡀ ⢀⡀ ⡀⣀ ⣀⣀ "
		echo " ⠣⠤ ⠣⠜ ⠣⠜ ⠣ ⠉⠉ ⠏  ⠣⠭ ⠘⠤ ⠏  ⠣⠜ ⠉⠉ ⠘⠤ ⠣⠭ ⠏  ⠇⠇⠇"
		sudo pacman -S cool-retro-term

		# ---------------------------------------------
		# Cleanup
		# ---------------------------------------------
		echo "┏━╸╻  ┏━╸┏━┓┏┓╻╻ ╻┏━┓"
		echo "┃  ┃  ┣╸ ┣━┫┃┗┫┃ ┃┣━┛"
		echo "┗━╸┗━╸┗━╸╹ ╹╹ ╹┗━┛╹  "

		# Remove orphaned packages
		echo " ⢀⣀ ⢀⣀ ⢀⣀ ⣇⡀ ⢀⡀"
		echo " ⠣⠤ ⠣⠼ ⠣⠤ ⠇⠸ ⠣⠭"
		sudo pacman -Rns $(pacman -Qdtq)
	else
		echo "INSTALLATION CANCELLED"
	fi
}

install_arch
