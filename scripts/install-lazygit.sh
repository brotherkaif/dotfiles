#!/bin/bash

# Import detectOS
. ./detect-os.sh

echo "INSTALL LAZYGIT"
# https://github.com/jesseduffield/lazygit#installation

case $(detectOS) in
"debian" | "pop" | "codespaces")
	echo "Debian detected. Installing..."

	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin

	rm lazygit.tar.gz
	rm lazygit
	;;
"fedora")
	echo "Fedora detected. Installing..."
	sudo dnf copr enable atim/lazygit -y
	sudo dnf install lazygit
	;;
"darwin")
	echo "Darwin detected. Installing..."

	brew install lazygit
	;;
*)
	echo "Could not detect OS! Skipping."
	echo "Value recieved: $(detectOS)"
	;;
esac
