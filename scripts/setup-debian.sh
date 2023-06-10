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
	sudo apt install build-essential -y
	sudo apt install manpages-dev -y
	sudo apt install ripgrep -y
	sudo apt install fd-find -y
	ln -s $(which fdfind) ~/.local/bin/fd
	sudo apt install tree -y
	curl https://fx.wtf | sh

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

	echo "Installing Github Copilot CLI"
	npm install -g @githubnext/github-copilot-cli

	echo "Installing dev container CLI"
	npm install -g @devcontainers/cli

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
