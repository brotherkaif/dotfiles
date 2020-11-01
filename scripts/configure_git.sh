#!/bin/bash
echo -e "\e[43;30m G I T \e[0m"

configure_git () {
	echo "This script will configure your git settings."
	echo "WARNING: DO NOT run as root!"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		echo -e "\e[43;30m key generation \e[0m"
		echo "Generating key..."
		mkdir -p ~/.ssh && ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/id_ed25519 -C "dm@kaif.dev"
		echo "...done!"
		echo "KEY GENERATED:"
		cat ~/.ssh/id_ed25519.pub	

		echo -e "\e[43;30m github testing \e[0m"
		echo "Test key with Github? (y/n)"
		read resp
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			ssh -T git@github.com
		fi

		echo -e "\e[43;30m git config \e[0m"
		echo "Setting user.email..."
		git config --global user.email "dm@kaif.dev"
		echo "...done!"
		echo "Setting user.name..."
		git config --global user.name "Kaif Ahmed"
		echo "...done!"
	else
		echo "GIT CONFIGURATION CANCELLED"
	fi
}

configure_git
