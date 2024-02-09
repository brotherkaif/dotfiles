#!/bin/bash

# Import detectOS
. ./detect-os.sh

echo "INSTALL HOMEBREW"
# https://brew.sh

case $(detectOS) in
"debian" | "pop")
	echo "Linux detected. Installing..."

	# install prerequisites
  sudo apt-get install build-essential

	# run installation script
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# setup PATH
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.local-config
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

	;;
"darwin")
	echo "Darwin detected. Installing..."

	# run installation script
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# setup PATH
  (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> $HOME/.local-config
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

	;;
*)
	echo "Could not detect OS! Skipping."
	echo "Value recieved: $(detectOS)"
	;;
esac
