#!/usr/bin/env bash
echo "┌──────────────────────────────────┐"
echo "│▜▘▙ ▌▞▀▖▀▛▘▞▀▖▌  ▌  ▞▀▖▀▛▘▜▘▞▀▖▙ ▌│"
echo "│▐ ▌▌▌▚▄  ▌ ▙▄▌▌  ▌  ▙▄▌ ▌ ▐ ▌ ▌▌▌▌│"
echo "│▐ ▌▝▌▖ ▌ ▌ ▌ ▌▌  ▌  ▌ ▌ ▌ ▐ ▌ ▌▌▝▌│"
echo "│▀▘▘ ▘▝▀  ▘ ▘ ▘▀▀▘▀▀▘▘ ▘ ▘ ▀▘▝▀ ▘ ▘│"
echo "└──────────────────────────────────┘"

install_debian_packages () {
	echo "This utility will install PACKAGES for debian."
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

		# update apt
		echo " ⡀⢀ ⣀⡀ ⢀⣸ ⢀⣀ ⣰⡀ ⢀⡀"
		echo " ⠣⠼ ⡧⠜ ⠣⠼ ⠣⠼ ⠘⠤ ⠣⠭"
		sudo apt update -y

		# upgrade any preinstalled packages
		echo " ⡀⢀ ⣀⡀ ⢀⡀ ⡀⣀ ⢀⣀ ⢀⣸ ⢀⡀"
		echo " ⠣⠼ ⡧⠜ ⣑⡺ ⠏  ⠣⠼ ⠣⠼ ⠣⠭"
		sudo apt upgrade -y

		# install snap
 		echo"⢀⣀ ⣀⡀ ⢀⣀ ⣀⡀"
 		echo"⠭⠕ ⠇⠸ ⠣⠼ ⡧⠜"
		sudo apt install snapd -y

		# install flatpak
		echo " ⣰⡁ ⡇ ⢀⣀ ⣰⡀ ⣀⡀ ⢀⣀ ⡇⡠"
		echo " ⢸  ⠣ ⠣⠼ ⠘⠤ ⡧⠜ ⠣⠼ ⠏⠢"
		sudo apt install flatpak -y

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
		sudo apt install stow -y

		# tree
		echo " ⣰⡀ ⡀⣀ ⢀⡀ ⢀⡀"
		echo " ⠘⠤ ⠏  ⠣⠭ ⠣⠭"
		sudo apt install tree -y

		# htop
		echo " ⣇⡀ ⣰⡀ ⢀⡀ ⣀⡀"
		echo " ⠇⠸ ⠘⠤ ⠣⠜ ⡧⠜"
		sudo apt install htop -y

		# git
		echo " ⢀⡀ ⠄ ⣰⡀"
		echo " ⣑⡺ ⠇ ⠘⠤"
		sudo apt install git -y

		# tmux
		echo " ⣰⡀ ⣀⣀  ⡀⢀ ⡀⢀"
		echo " ⠘⠤ ⠇⠇⠇ ⠣⠼ ⠜⠣"
		sudo apt install tmux -y

		# nnn
 		echo "⣀⡀ ⣀⡀ ⣀⡀"
 		echo "⠇⠸ ⠇⠸ ⠇⠸"
		sudo apt install nnn -y

		# neovim
		echo " ⣀⡀ ⢀⡀ ⢀⡀ ⡀⢀ ⠄ ⣀⣀ "
		echo " ⠇⠸ ⠣⠭ ⠣⠜ ⠱⠃ ⠇ ⠇⠇⠇"
		sudo apt install neovim -y

		# irssi
		echo " ⠄ ⡀⣀ ⢀⣀ ⢀⣀ ⠄"
		echo " ⠇ ⠏  ⠭⠕ ⠭⠕ ⠇"
		sudo apt install irssi -y

		# newsboat
 		echo "⣀⡀ ⢀⡀ ⡀ ⢀ ⢀⣀ ⣇⡀ ⢀⡀ ⢀⣀ ⣰⡀"
 		echo "⠇⠸ ⠣⠭ ⠱⠱⠃ ⠭⠕ ⠧⠜ ⠣⠜ ⠣⠼ ⠘⠤"
		sudo apt install newsboat -y

		# lynx
 		echo "⡇ ⡀⢀ ⣀⡀ ⡀⢀"
 		echo "⠣ ⣑⡺ ⠇⠸ ⠜⠣"
		sudo apt install lynx -y

		# ---------------------------------------------
		# Applications
		# ---------------------------------------------
		echo "┏━┓┏━┓┏━┓╻  ╻┏━╸┏━┓╺┳╸╻┏━┓┏┓╻┏━┓"
		echo "┣━┫┣━┛┣━┛┃  ┃┃  ┣━┫ ┃ ┃┃ ┃┃┗┫┗━┓"
		echo "╹ ╹╹  ╹  ┗━╸╹┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹┗━┛"

		# docker
		echo " ⢀⣸ ⢀⡀ ⢀⣀ ⡇⡠ ⢀⡀ ⡀⣀"
		echo " ⠣⠼ ⠣⠜ ⠣⠤ ⠏⠢ ⠣⠭ ⠏ "
		# verify the installaiton
		sudo apt install docker -y
		docker run hello-world

		# docker compose
		echo " ⢀⣸ ⢀⡀ ⢀⣀ ⡇⡠ ⢀⡀ ⡀⣀   ⢀⣀ ⢀⡀ ⣀⣀  ⣀⡀ ⢀⡀ ⢀⣀ ⢀⡀"
		echo " ⠣⠼ ⠣⠜ ⠣⠤ ⠏⠢ ⠣⠭ ⠏    ⠣⠤ ⠣⠜ ⠇⠇⠇ ⡧⠜ ⠣⠜ ⠭⠕ ⠣⠭"
		sudo apt install docker-compose -y

		# vscode
		echo " ⡀⢀ ⢀⣀    ⢀⣀ ⢀⡀ ⢀⣸ ⢀⡀"
		echo " ⠱⠃ ⠭⠕ ⠉⠉ ⠣⠤ ⠣⠜ ⠣⠼ ⠣⠭"
		sudo snap install codium --classic

		# alacritty
 		echo "⢀⣀ ⡇ ⢀⣀ ⢀⣀ ⡀⣀ ⠄ ⣰⡀ ⣰⡀ ⡀⢀"
 		echo "⠣⠼ ⠣ ⠣⠼ ⠣⠤ ⠏  ⠇ ⠘⠤ ⠘⠤ ⣑⡺"
 		sudo snap install alacritty --classic

		# ---------------------------------------------
		# Stupid Terminal Nonsense
		# ---------------------------------------------
		echo "┏┓╻┏━┓┏┓╻┏━┓┏━╸┏┓╻┏━┓┏━╸"
		echo "┃┗┫┃ ┃┃┗┫┗━┓┣╸ ┃┗┫┗━┓┣╸ "
		echo "╹ ╹┗━┛╹ ╹┗━┛┗━╸╹ ╹┗━┛┗━╸"

		# figlet
		echo " ⣰⡁ ⠄ ⢀⡀ ⡇ ⢀⡀ ⣰⡀"
		echo " ⢸  ⠇ ⣑⡺ ⠣ ⠣⠭ ⠘⠤"
		sudo apt install figlet -y

		# toilet
		echo " ⣰⡀ ⢀⡀ ⠄ ⡇ ⢀⡀ ⣰⡀"
		echo " ⠘⠤ ⠣⠜ ⠇ ⠣ ⠣⠭ ⠘⠤"
		sudo apt install toilet -y

		# mplayer
		echo " ⣀⣀  ⣀⡀ ⡇ ⢀⣀ ⡀⢀ ⢀⡀ ⡀⣀"
		echo " ⠇⠇⠇ ⡧⠜ ⠣ ⠣⠼ ⣑⡺ ⠣⠭ ⠏ "
		sudo apt install mplayer -y

		# cool-retro-term
		echo " ⢀⣀ ⢀⡀ ⢀⡀ ⡇    ⡀⣀ ⢀⡀ ⣰⡀ ⡀⣀ ⢀⡀    ⣰⡀ ⢀⡀ ⡀⣀ ⣀⣀ "
		echo " ⠣⠤ ⠣⠜ ⠣⠜ ⠣ ⠉⠉ ⠏  ⠣⠭ ⠘⠤ ⠏  ⠣⠜ ⠉⠉ ⠘⠤ ⠣⠭ ⠏  ⠇⠇⠇"
		sudo snap install cool-retro-term --classic

		# ---------------------------------------------
		# Cleanup
		# ---------------------------------------------
		echo "┏━╸╻  ┏━╸┏━┓┏┓╻╻ ╻┏━┓"
		echo "┃  ┃  ┣╸ ┣━┫┃┗┫┃ ┃┣━┛"
		echo "┗━╸┗━╸┗━╸╹ ╹╹ ╹┗━┛╹  "

		# cleanup the cache
		echo " ⢀⣀ ⢀⣀ ⢀⣀ ⣇⡀ ⢀⡀"
		echo " ⠣⠤ ⠣⠼ ⠣⠤ ⠇⠸ ⠣⠭"
		sudo apt clean
	else
		echo "INSTALLATION CANCELLED"
	fi
}

install_debian_packages
