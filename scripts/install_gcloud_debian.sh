#!/usr/bin/env bash
echo -e "\e[43;30m GOOGLE CLOUD SDK \e[0m"

install_gcloud_debian () {
	echo "This script will install the Google Cloud SDK"
	echo "WARNING: DO NOT run as root!"
	echo "Proceed? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list	
		sudo apt-get install apt-transport-https ca-certificates gnupg -y
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
		sudo apt-get update && sudo apt-get install google-cloud-sdk	
		gcloud init
	else
		echo "INSTALLATION CANCELLED"
	fi
}

install_gcloud_debian
