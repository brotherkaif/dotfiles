#!/bin/bash
echo -e "\e[43;30m D I R E C T O R I E S \e[0m"

create_directories() {
	echo "This script will create directories in home."
	echo "WARNING: DO NOT run as root!"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then

		echo -e "\e[43;30m projects \e[0m"
		echo "Making a PROJECTS folder in $HOME/projects if it doesn't already exist..."
		mkdir -pv $HOME/projects
		echo "...done!"

		echo -e "\e[43;30m playground \e[0m"
		echo "Making a PLAYGROUND folder in $HOME/playground if it doesn't already exist..."
		mkdir -pv $HOME/playground
		echo "...done!"

		echo -e "\e[43;30m apps \e[0m"
		echo "Making an APPS folder in $HOME/.apps if it doesn't already exist..."
		mkdir -pv $HOME/.apps
		echo "...done!"
	else
		echo "DIRECTORY CREATION CANCELLED"
	fi
}

create_directories
