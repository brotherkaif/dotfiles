#!/bin/bash

# Import detectOS
. ./detect-os.sh

echo "INSTALL FLATPAK"
# https://flatpak.org/setup/Debian

case $(detectOS) in
"debian")
	echo "Debian detected. Installing..."

	echo "Updating existing packages"
	# update apt
	sudo apt update -y

	# upgrade any preinstalled packages
	sudo apt upgrade -y

	# install flatpak
	sudo apt install flatpak -y
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

	echo "Completed!"
	echo "RESTART REQUIRED"
	;;
*)
	echo "Could not detect OS! Skipping."
	echo "Value recieved: $(detectOS)"
	;;
esac
