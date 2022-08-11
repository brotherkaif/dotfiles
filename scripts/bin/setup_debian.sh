#!/usr/bin/env bash

install_debian_packages () {
		echo "┌──────────────────────────────────┐"
		echo "│▜▘▙ ▌▞▀▖▀▛▘▞▀▖▌  ▌  ▞▀▖▀▛▘▜▘▞▀▖▙ ▌│"
		echo "│▐ ▌▌▌▚▄  ▌ ▙▄▌▌  ▌  ▙▄▌ ▌ ▐ ▌ ▌▌▌▌│"
		echo "│▐ ▌▝▌▖ ▌ ▌ ▌ ▌▌  ▌  ▌ ▌ ▌ ▐ ▌ ▌▌▝▌│"
		echo "│▀▘▘ ▘▝▀  ▘ ▘ ▘▀▀▘▀▀▘▘ ▘ ▘ ▀▘▝▀ ▘ ▘│"
		echo "└──────────────────────────────────┘"
		echo "This utility will install packages for DEBIAN."
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
				echo "UPDATE"
				sudo apt update -y

				# upgrade any preinstalled packages
				echo "UPGRADE"
				sudo apt upgrade -y

				# ---------------------------------------------
				# Programming Languages and Frameworks
				# ---------------------------------------------
				echo "┏━╸┏━┓┏━┓┏┳┓┏━╸╻ ╻┏━┓┏━┓╻┏ ┏━┓"
				echo "┣╸ ┣┳┛┣━┫┃┃┃┣╸ ┃╻┃┃ ┃┣┳┛┣┻┓┗━┓"
				echo "╹  ╹┗╸╹ ╹╹ ╹┗━╸┗┻┛┗━┛╹┗╸╹ ╹┗━┛"

				# node
				echo "NODE"
				echo "Setting up node/nvm..."
				wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
				echo "...done!"

				# love
				echo "LOVE"
				wget -O $HOME/.local/bin/love https://github.com/love2d/love/releases/download/11.4/love-11.4-x86_64.AppImage
				chmod u+x $HOME/.local/bin/love

				# ---------------------------------------------
				# Tools
				# ---------------------------------------------
				echo "╺┳╸┏━┓┏━┓╻  ┏━┓"
				echo " ┃ ┃ ┃┃ ┃┃  ┗━┓"
				echo " ╹ ┗━┛┗━┛┗━╸┗━┛"

				# stow
				echo "STOW"
				sudo apt install stow -y

				# tree
				echo "TREE"
				sudo apt install tree -y

				# htop
				echo "HTOP"
				sudo apt install htop -y

				# git
				echo "GIT"
				sudo apt install git -y

				# tmux
				echo "TMUX"
				sudo apt install tmux -y

				# vim
				echo "VIM"
				sudo apt install vim -y

				# irssi
				echo "IRSSI"
				sudo apt install irssi -y

				# ---------------------------------------------
				# Applications
				# ---------------------------------------------
				echo "┏━┓┏━┓┏━┓╻  ╻┏━╸┏━┓╺┳╸╻┏━┓┏┓╻┏━┓"
				echo "┣━┫┣━┛┣━┛┃  ┃┃  ┣━┫ ┃ ┃┃ ┃┃┗┫┗━┓"
				echo "╹ ╹╹  ╹  ┗━╸╹┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹┗━┛"

				# docker
				echo "DOCKER"
				# official installation instructions: https://docs.docker.com/install/linux/docker-ce/ubuntu/
				sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
				curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
				sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
				sudo apt update -y
				sudo apt install docker-ce docker-ce-cli containerd.io -y
				echo "$PROMPT Verifying docker installation using a hello world container..."
				# verify the installaiton
				docker run hello-world

				# docker compose
				echo "DOCKER COMPOSE"
				sudo apt install docker-compose -y

				# neovim
				echo "NEOVIM"
				wget -O $HOME/.local/bin/nvim https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
				chmod u+x $HOME/.local/bin/nvim

				# vscode
				echo "VSCODE"
				# installation instructions: https://code.visualstudio.com/docs/setup/linux
				wget -O /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
				sudo apt install /tmp/vscode.deb
				rm /tmp/vscode.deb

				# ---------------------------------------------
				# Stupid Terminal Nonsense
				# ---------------------------------------------
				echo "┏┓╻┏━┓┏┓╻┏━┓┏━╸┏┓╻┏━┓┏━╸"
				echo "┃┗┫┃ ┃┃┗┫┗━┓┣╸ ┃┗┫┗━┓┣╸ "
				echo "╹ ╹┗━┛╹ ╹┗━┛┗━╸╹ ╹┗━┛┗━╸"

				# figlet
				echo "FIGLET"
				sudo apt install figlet -y

				# toilet
				echo "TOILET"
				sudo apt install toilet -y

				# mplayer
				echo "MPLAYER"
				sudo apt install mplayer -y

				# cool-retro-term
				echo "COOL RETRO TERM"
				wget -O $HOME/.local/bin/crt https://github.com/Swordfish90/cool-retro-term/releases/download/1.1.1/Cool-Retro-Term-1.1.1-x86_64.AppImage
				chmod u+x $HOME/.local/bin/crt

				# ---------------------------------------------
				# Cleanup
				# ---------------------------------------------
				echo "┏━╸╻  ┏━╸┏━┓┏┓╻╻ ╻┏━┓"
				echo "┃  ┃  ┣╸ ┣━┫┃┗┫┃ ┃┣━┛"
				echo "┗━╸┗━╸┗━╸╹ ╹╹ ╹┗━┛╹  "

				# cleanup the cache
				echo "CACHE"
				sudo apt clean
		else
				echo "INSTALLATION CANCELLED"
		fi
}

if [ $( echo "$OSTYPE" | grep 'linux-gnu' ) ] ; then
		echo "DEBIAN OS DETECTED"
		install_debian_packages
else
		echo "NON-DEBIAN OS DETECTED, SKIPPING"
fi
