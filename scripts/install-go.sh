#!/bin/bash

# Import detectOS
. ./detect-os.sh

echo "INSTALL GO"
# https://go.dev/doc/install
# https://www.digitalocean.com/community/tutorials/how-to-install-go-on-debian-10

case $(detectOS) in
"debian" | "pop")
	echo "Debian distro detected. Installing..."

	# Install prerequisites
	sudo apt update
	sudo apt install curl

	VERSION="go1.20.6.linux-amd64.tar.gz"

	# Download Go
	curl -LO https://go.dev/dl/$VERSION

	# Remove existing install
	sudo rm -rf /usr/local/go

	# Extract executable verbosely and move to /usr/local/
	sudo tar -xvf $VERSION -C /usr/local/

	# Cleanup
	rm $VERSION

	# Add variables to profile
	# Check if the GOPATH and PATH variables are already set in the .profile file
	GOPATH_LINE=$(grep 'export GOPATH=' ~/.profile)
	PATH_LINE=$(grep 'export PATH=' ~/.profile)

	# If they are not set, add them to the end of the file
	if [ -z "$GOPATH_LINE" ]; then
		echo "" >>$HOME/.profile
		echo "# GO SETUP" >>$HOME/.profile
		echo "export GOPATH=\$HOME/projects" >>$HOME/.profile
	fi

	if [ -z "$PATH_LINE" ]; then
		echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin" >>$HOME/.profile
	fi

	echo "DONE. RESTART REQUIRED"

	;;
"darwin")
	echo "Darwin detected. Installing..."

	brew install go
	;;
*)
	echo "Could not detect OS! Skipping."
	echo "Value recieved: $(detectOS)"
	;;
esac
