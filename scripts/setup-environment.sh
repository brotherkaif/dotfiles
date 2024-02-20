#!/usr/bin/env bash

setup_environment () {
		echo "         _           "
		echo " ___ ___| |_ _ _ ___ "
		echo "|_ -| -_|  _| | | . |"
		echo "|___|___|_| |___|  _|"
		echo "                |_|  "
		echo "This script will install packages for unix based systems."
		echo "NOTE: Install homebrew first (goto brew.sh)"
		echo "WARNING: DO NOT run as root!"
		echo "Proceed? (y/n)"
		read resp
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
				echo "|_  _  _ _  _ |_  _ _   "
				echo "| |(_)| | |(/_|_)| (/_VV"

				echo "UPDATE"
				brew update

				echo "UPGRADE"
				brew upgrade

				echo "| _  _  _     _  _  _  _"
				echo "|(_|| |(_||_|(_|(_|(/__\\"
				echo "        _|       _|     "

				echo "NODE"
				brew install fnm

				echo "GO"
				brew install go

				echo "_|_ _  _ | _"
				echo " | (_)(_)|_\\"

				echo "STOW"
				brew install stow

				echo "FX"
				brew install fx

				echo "TREE"
				brew install tree

				echo "HTOP"
				brew install htop

				echo "STARSHIP"
				brew install starship

				echo "ZELLIJ"
				brew install zellij

				echo "NEOVIM"
				brew install nvim --HEAD

				echo "GLOW"
				brew install glow

				echo "MODS"
				brew install mods

				echo "GITHUB CLI"
				brew install gh

				echo "WEECHAT"
				brew install weechat

				echo "FIRA CODE NERD FONT"
				brew install --cask font-fira-code-nerd-font

				echo " _| _  _  _     _ "
				echo "(_|(/_(_|| ||_||_)"
				echo "               |  "

				# Remove outdated versions from the cellar
				echo "CACHE"
				brew cleanup
		else
				echo "INSTALLATION CANCELLED"
		fi
}

setup_environment
