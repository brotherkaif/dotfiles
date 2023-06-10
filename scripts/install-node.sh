#!/bin/bash
# Import detectOS
. ./detect-os.sh

echo "INSTALL NODE"
# https://github.com/tj/n

case $(detectOS) in
    "debian" | "fedora" | "codespaces" | "darwin")
				echo "OS detected. Installing..."

				# make cache folder (if missing) and take ownership
				sudo mkdir -p /usr/local/n
				sudo chown -R $(whoami) /usr/local/n

				# make sure the required folders exist (safe to execute even if they already exist)
				sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

				# take ownership of Node.js install destination folders
				sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

				# pull down n installation script
				curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o $HOME/n

				# install node lts via n
				bash $HOME/n lts

				# Now node and npm are available
				npm install -g n
				;;
    *)
				echo "Could not detect OS! Skipping."
				echo "Value recieved: $(detectOS)"
				;;
esac
