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
		echo -e "\e[43;30m SETUP \e[0m"

		# update apt
		echo -e "\e[43;30m update \e[0m"
		sudo apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com
		sudo apt update -y

		# upgrade any preinstalled packages
		echo -e "\e[43;30m upgrade \e[0m"
		sudo apt upgrade -y

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

		# ---------------------------------------------
		# Applications
		# ---------------------------------------------
		echo -e "\e[43;30m APPLICATIONS \e[0m"

		# docker
		echo -e "\e[43;30m docker \e[0m"
		sudo apt install docker -y
		# verify the installaiton
		docker run hello-world

		# docker compose
		echo -e "\e[43;30m docker compose \e[0m"
		sudo apt install docker-compose -y

		# vscode
		echo -e "\e[43;30m vs-code \e[0m"
		curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
		sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
		sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
		sudo apt-get install apt-transport-https
		sudo apt-get update
		sudo apt-get install code
		code --install-extension Shan.code-settings-sync

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

		# mplayer
		echo -e "\e[43;30m mplayer \e[0m"
		sudo apt install mplayer -y

		# cool-retro-term
		echo -e "\e[43;30m cool-retro-term \e[0m"
		sudo snap install cool-retro-term --classic

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
