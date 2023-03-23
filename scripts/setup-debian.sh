#!/bin/bash
detectDistro() {
    local distro="UNKNOWN"

    if [[ -f /etc/os-release ]] && [[ -d /workspaces ]]; then
        distro="codespaces"
    elif [[ -f /etc/os-release ]]; then
        distro=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
    fi

    echo "$distro"
}

detectOS () {
    local operatingSystem="UNKNOWN"
    local unamestr=$(uname)

    if [[ "$unamestr" == "Linux" ]]; then
        operatingSystem=$(detectDistro)
    elif [[ "$unamestr" == "Darwin" ]]; then
        operatingSystem="macos"
    fi

    echo "$operatingSystem"
}

case $(detectOS) in
    "debian")
	echo "DEBIAN DETECTED. RUNNING SETUP SCRIPT"

	echo "Updating existing packages"
	# update apt
	sudo apt update -y

	# upgrade any preinstalled packages
	sudo apt upgrade -y

	echo "Install tools"
	sudo apt install tree -y

	echo "Installing Node Manager (n)"
	# installation instructions: https://www.npmjs.com/package/n#installation
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

	echo "Installing Docker"
	# installation instructions: https://docs.docker.com/install/linux/docker-ce/ubuntu/
	sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt update -y
	sudo apt install docker-ce docker-ce-cli containerd.io -y

	echo "Verifying docker installation using a hello world container..."
	# verify the installaiton
	docker run hello-world

	echo "Installing Docker Compose"
	sudo apt install docker-compose -y

	echo "Installing Neovim"
	# installation instructions: https://github.com/neovim/neovim/wiki/Installing-Neovim
	# remove existing binaries
	rm $HOME/.local/bin/nvim
	wget -O /tmp/nvim.deb https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
	sudo apt install /tmp/nvim.deb -y
	rm /tmp/nvim.deb

	echo "Installing VSCode"
	# installation instructions: https://code.visualstudio.com/docs/setup/linux
	wget -O /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
	sudo apt install /tmp/vscode.deb -y
	rm /tmp/vscode.deb

	echo "Installing Github CLI"
	# installation instructions: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
	type -p curl >/dev/null || sudo apt install curl -y
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
	&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

	echo "Installing Flatpak"
	# installation instructions: https://flatpak.org/setup/Debian
	sudo apt install flatpak -y
	sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

	echo "Cleanup cache"
	sudo apt clean
        ;;
    *)
        echo "DEBIAN NOT DETECTED. SKIPPING."
        ;;
esac
