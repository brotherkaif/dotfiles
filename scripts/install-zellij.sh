#!/bin/bash

# Import detectOS
. ./detect-os.sh

echo "INSTALL ZELLIJ"
# https://zellij.dev/documentation/installation.html

case $(detectOS) in
"debian" | "pop")
	echo "Linux detected. Installing..."

	# download zellij binary
	curl -LO https://github.com/zellij-org/zellij/releases/download/v0.39.2/zellij-x86_64-unknown-linux-musl.tar.gz

	# untar file
	tar -xvf zellij*.tar.gz

	# move bin
	mkdir -p $HOME/.local/bin
	mv zellij $HOME/.local/bin/zellij

	# make executable
	chmod u+x $HOME/.local/bin/zellij

	# clean up
	rm zellij*.tar.gz
	;;
"darwin")
	echo "Darwin detected. Installing..."

	brew install zellij
	;;
*)
	echo "Could not detect OS! Skipping."
	echo "Value recieved: $(detectOS)"
	;;
esac
