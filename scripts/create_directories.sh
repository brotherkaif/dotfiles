#!/bin/bash
echo "┌───────────────────────────────┐"
echo "│▛▀▖▜▘▛▀▖▛▀▘▞▀▖▀▛▘▞▀▖▛▀▖▜▘▛▀▘▞▀▖│"
echo "│▌ ▌▐ ▙▄▘▙▄ ▌   ▌ ▌ ▌▙▄▘▐ ▙▄ ▚▄ │"
echo "│▌ ▌▐ ▌▚ ▌  ▌ ▖ ▌ ▌ ▌▌▚ ▐ ▌  ▖ ▌│"
echo "│▀▀ ▀▘▘ ▘▀▀▘▝▀  ▘ ▝▀ ▘ ▘▀▘▀▀▘▝▀ │"
echo "└───────────────────────────────┘"

create_directories() {
	echo "This script will create directories in home."
	echo "WARNING: DO NOT run as root!"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		echo "CREATING DIRECTORIES"

		echo "┏━┓┏━┓┏━┓ ┏┓┏━╸┏━╸╺┳╸┏━┓"
		echo "┣━┛┣┳┛┃ ┃  ┃┣╸ ┃   ┃ ┗━┓"
		echo "╹  ╹┗╸┗━┛┗━┛┗━╸┗━╸ ╹ ┗━┛"
		echo "Making a PROJECTS folder in $HOME/projects if it doesn't already exist..."
		mkdir -pv $HOME/projects
		echo "...done!"

		echo "┏━┓╻  ┏━┓╻ ╻┏━╸┏━┓┏━┓╻ ╻┏┓╻╺┳┓"
		echo "┣━┛┃  ┣━┫┗┳┛┃╺┓┣┳┛┃ ┃┃ ┃┃┗┫ ┃┃"
		echo "╹  ┗━╸╹ ╹ ╹ ┗━┛╹┗╸┗━┛┗━┛╹ ╹╺┻┛"
		echo "Making a PLAYGROUND folder in $HOME/playground if it doesn't already exist..."
		mkdir -pv $HOME/playground
		echo "...done!"

		echo "┏━┓┏━┓┏━┓┏━┓"
		echo "┣━┫┣━┛┣━┛┗━┓"
		echo "╹ ╹╹  ╹  ┗━┛"
		echo "Making an APPS folder in $HOME/.apps if it doesn't already exist..."
		mkdir -pv $HOME/.apps
		echo "...done!"
	else
		echo "DIRECTORY CREATION CANCELLED"
	fi
}

create_directories
