#!/bin/bash
echo -e "\e[43;30m S E T U P \e[0m"

setup_cloud_env_debian () {
	echo "This script will setup a CLOUD environment for debian."
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
		# Tools
		# ---------------------------------------------
		echo -e "\e[43;30m TOOLS \e[0m"

		# pass
		echo -e "\e[43;30m pass \e[0m"
		sudo apt install pass -y

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

		# brave
		echo -e "\e[43;30m brave \e[0m"
		sudo apt update
		sudo apt install apt-transport-https curl
		curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
		echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
		sudo apt update
		sudo apt install brave-browser

		# ---------------------------------------------
		# GCloud
		# ---------------------------------------------
		echo -e "\e[43;30m GCLOUD \e[0m"

		# gcp sdk
		echo -e "\e[43;30m google cloud sdk \e[0m"
		echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list	
		sudo apt-get install apt-transport-https ca-certificates gnupg -y
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
		sudo apt-get update && sudo apt-get install google-cloud-sdk	
		gcloud init

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

setup_cloud_env_debian
