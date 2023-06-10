#!/bin/bash
# Import detectOS
. ./detect-os.sh

echo "INSTALL RUST"
# https://rustup.rs/

case $(detectOS) in
    "debian" | "fedora" | "codespaces" | "darwin")
				echo "OS detected. Installing..."

				curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
				;;
    *)
				echo "Could not detect OS! Skipping."
				echo "Value recieved: $(detectOS)"
				;;
esac
