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

				# fx
				echo "FX"
				brew install fx

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
