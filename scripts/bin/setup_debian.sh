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

				echo "...done!"

				# ---------------------------------------------
				# Programming Languages and Frameworks
				# ---------------------------------------------
				echo "┏━╸┏━┓┏━┓┏┳┓┏━╸╻ ╻┏━┓┏━┓╻┏ ┏━┓"
				echo "┣╸ ┣┳┛┣━┫┃┃┃┣╸ ┃╻┃┃ ┃┣┳┛┣┻┓┗━┓"
				echo "╹  ╹┗╸╹ ╹╹ ╹┗━╸┗┻┛┗━┛╹┗╸╹ ╹┗━┛"

				# node
				echo "NODE"
				# make cache folder (if missing) and take ownership
				sudo mkdir -p /usr/local/n
				sudo chown -R $(whoami) /usr/local/n
				# make sure the required folders exist (safe to execute even if they already exist)
				sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
				# take ownership of Node.js install destination folders
				sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
				# pull down n installation script
				curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o $HOME/n
				# install node lts via n
				bash $HOME/n lts
				# Now node and npm are available
				npm install -g n

				# python
				echo "PYTHON"
				echo "already installed on Debian"

				# cargo
				echo "RUST"
				curl https://sh.rustup.rs -sSf | sh

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
				rm $HOME/.local/bin/nvim
				rm $HOME/.config/nvim
				wget -O /tmp/nvim.deb https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
				sudo apt install /tmp/nvim.deb -y
				rm /tmp/nvim.deb

				# lunarvim
				echo "LUNARVIM"
				bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
				LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y

				# vscode
				echo "VSCODE"
				# installation instructions: https://code.visualstudio.com/docs/setup/linux
				wget -O /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
				sudo apt install /tmp/vscode.deb
				rm /tmp/vscode.deb

				# love
				echo "OBSIDIAN"
				wget -O $HOME/.local/bin/obsidian https://github.com/obsidianmd/obsidian-releases/releases/download/v1.0.3/Obsidian-1.0.3.AppImage
				chmod u+x $HOME/.local/bin/obsidian

				echo "...done!"

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

				echo "...done!"

				# ---------------------------------------------
				# Cleanup
				# ---------------------------------------------
				echo "┏━╸╻  ┏━╸┏━┓┏┓╻╻ ╻┏━┓"
				echo "┃  ┃  ┣╸ ┣━┫┃┗┫┃ ┃┣━┛"
				echo "┗━╸┗━╸┗━╸╹ ╹╹ ╹┗━┛╹  "

				# cleanup the cache
				echo "CACHE"
				sudo apt clean

				echo "...done!"
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
