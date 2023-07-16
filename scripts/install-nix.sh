#!/bin/bash

# Import detectOS
. ./detect-os.sh

echo "INSTALL NIX"
# https://nixos.org/download.html

case $(detectOS) in
"darwin")
	echo "Darwin detected. Installing..."

	sh <(curl -L https://nixos.org/nix/install)

	# nix-darwin required on macos
	# http://daiderd.com/nix-darwin/
	nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
	./result/bin/darwin-installer
	;;
*)
	echo "Could not detect OS! Skipping."
	echo "Value recieved: $(detectOS)"
	;;
esac
