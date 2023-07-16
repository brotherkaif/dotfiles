#!/bin/bash

# Import detectOS
. ./detect-os.sh

echo "INSTALL STARSHIP"
# https://starship.rs

case $(detectOS) in
"debian" | "fedora" | "codespaces")
	echo "Linux detected. Installing..."
	curl -sS https://starship.rs/install.sh | sh
	;;
*)
	echo "Could not detect OS! Skipping."
	echo "Value recieved: $(detectOS)"
	;;
esac
