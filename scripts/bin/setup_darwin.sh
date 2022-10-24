#!/usr/bin/env bash

install_darwin_packages () {
		echo "┌──────────────────────────────────┐"
		echo "│▜▘▙ ▌▞▀▖▀▛▘▞▀▖▌  ▌  ▞▀▖▀▛▘▜▘▞▀▖▙ ▌│"
		echo "│▐ ▌▌▌▚▄  ▌ ▙▄▌▌  ▌  ▙▄▌ ▌ ▐ ▌ ▌▌▌▌│"
		echo "│▐ ▌▝▌▖ ▌ ▌ ▌ ▌▌  ▌  ▌ ▌ ▌ ▐ ▌ ▌▌▝▌│"
		echo "│▀▘▘ ▘▝▀  ▘ ▘ ▘▀▀▘▀▀▘▘ ▘ ▘ ▀▘▝▀ ▘ ▘│"
		echo "└──────────────────────────────────┘"
		echo "This utility will install packages for DARWIN."
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
				echo "UPDATE"
				brew update

				# Upgrade any already-installed formulae
				echo "UPGRADE"
				brew upgrade

				# Core Utils
				echo "CORE UTILS"
				brew install coreutils

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
				python3 -m ensurepip

				# cargo
				echo "RUST"
				brew install --cask cargo

				# ---------------------------------------------
				# Tools
				# ---------------------------------------------
				echo "╺┳╸┏━┓┏━┓╻  ┏━┓"
				echo " ┃ ┃ ┃┃ ┃┃  ┗━┓"
				echo " ╹ ┗━┛┗━┛┗━╸┗━┛"

				# stow
				echo "STOW"
				brew install stow

				# tree
				echo "TREE"
				brew install tree

				# htop
				echo "HTOP"
				brew install htop

				# git
				echo "GIT"
				echo "skipping: git already installed on darwin"

				# tmux
				echo "TMUX"
				brew install tmux

				# ffmpeg
				echo "FFMPEG"
				brew install ffmpeg

				# ---------------------------------------------
				# Applications
				# ---------------------------------------------
				echo "┏━┓┏━┓┏━┓╻  ╻┏━╸┏━┓╺┳╸╻┏━┓┏┓╻┏━┓"
				echo "┣━┫┣━┛┣━┛┃  ┃┃  ┣━┫ ┃ ┃┃ ┃┃┗┫┗━┓"
				echo "╹ ╹╹  ╹  ┗━╸╹┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹┗━┛"

				# neovim
				echo "NEOVIM"
				rm -rf ~/.local/share/nvim
				brew install neovim

				# lunarvim
				echo "LUNARVIM"
				bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y

				# github cli
				echo "GITHUB CLI"
				brew install gh

				# docker
				echo "DOCKER"
				brew install docker

				# vscode
				echo "VSCODE"
				brew cask install visual-studio-code

				# kitty
				echo "KITTY"
				brew install --cask kitty

				# ---------------------------------------------
				# Stupid Terminal Nonsense
				# ---------------------------------------------
				echo "┏┓╻┏━┓┏┓╻┏━┓┏━╸┏┓╻┏━┓┏━╸"
				echo "┃┗┫┃ ┃┃┗┫┗━┓┣╸ ┃┗┫┗━┓┣╸ "
				echo "╹ ╹┗━┛╹ ╹┗━┛┗━╸╹ ╹┗━┛┗━╸"

				# figlet
				echo "FIGLET"
				brew install figlet

				# toilet
				echo "TOILET"
				brew install toilet

				# ---------------------------------------------
				# Cleanup
				# ---------------------------------------------
				echo "┏━╸╻  ┏━╸┏━┓┏┓╻╻ ╻┏━┓"
				echo "┃  ┃  ┣╸ ┣━┫┃┗┫┃ ┃┣━┛"
				echo "┗━╸┗━╸┗━╸╹ ╹╹ ╹┗━┛╹  "

				# Remove outdated versions from the cellar
				echo "CACHE"
				brew cleanup
		else
				echo "INSTALLATION CANCELLED"
		fi
}
if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
		echo "DARWIN OS DETECTED"
		install_darwin_packages
else
		echo "NON-DARWIN OS DETECTED, SKIPPING"
fi
