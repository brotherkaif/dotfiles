#!/bin/bash
# Import detectOS
. ./detect-os.sh

echo "INSTALL GITHUB CLI"
# https://cli.github.com/manual/installation
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md

case $(detectOS) in
    "debian" | "codespaces")
				echo "Debian detected. Installing..."

				type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
				curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
				&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
				&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
				&& sudo apt update \
				&& sudo apt install gh -y
				;;
    "fedora")
				echo "Fedora detected. Installing..."
				sudo dnf install 'dnf-command(config-manager)'
				sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
				sudo dnf install gh
				;;
    "darwin")
				echo "macOS detected. Installing..."
				brew install gh
				;;
	*)
				echo "Could not detect OS! Skipping."
				echo "Value recieved: $(detectOS)"
				;;
esac
