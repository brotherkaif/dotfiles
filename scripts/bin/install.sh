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
        echo "Debian detected, running setup script."
        ./setup-debian.sh
        ;;
    "fedora")
        echo "Fedora detected, running setup script."
        ./setup-fedora.sh
        ;;
    "macos")
        echo "MacOS detected, running setup script."
        ./setup-darwin.sh
        ;;
    "codespaces")
        echo "GitHub Codespace instance detected, running setup script."
	# Make passwordless sudo work
	export SUDO_ASKPASS=/bin/true

	# Install neovim
	wget -O /tmp/nvim.deb https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
	sudo apt install /tmp/nvim.deb -y
	rm /tmp/nvim.deb
        ;;
    *)
        echo "Unknown OS detected, no script executed"
        ;;
esac
