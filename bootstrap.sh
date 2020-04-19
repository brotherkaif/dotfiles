#!/bin/bash
echo "┌───────────────────────────┐"
echo "│▛▀▖▞▀▖▞▀▖▀▛▘▞▀▖▀▛▘▛▀▖▞▀▖▛▀▖│"
echo "│▙▄▘▌ ▌▌ ▌ ▌ ▚▄  ▌ ▙▄▘▙▄▌▙▄▘│"
echo "│▌ ▌▌ ▌▌ ▌ ▌ ▖ ▌ ▌ ▌▚ ▌ ▌▌  │"
echo "│▀▀ ▝▀ ▝▀  ▘ ▝▀  ▘ ▘ ▘▘ ▘▘  │"
echo "└───────────────────────────┘"

detect_os () {
	if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
		echo "DARWIN DETECTED"
		sh scripts/install_darwin.sh
	fi

	if [ $( echo "$OSTYPE" | grep 'linux-gnu' ) ] ; then
		echo "DEBIAN DETECTED"
		sh scripts/install_debian.sh
	fi
}

sh scripts/create_directories.sh
detect_os
sh scripts/symlink_config.sh
