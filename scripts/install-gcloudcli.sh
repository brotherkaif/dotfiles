#!/bin/bash

# Import detectOS
. ./detect-os.sh

echo "INSTALL GOOGLE CLOUD CLI"
# https://cloud.google.com/sdk/docs/install

case $(detectOS) in
"debian" | "fedora" | "codespaces")
	echo "Linux detected. Installing..."

	curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-434.0.0-linux-x86_64.tar.gz
	tar -xf google-cloud-cli-434.0.0-linux-x86_64.tar.gz
	./google-cloud-sdk/install.sh
	;;
*)
	echo "Could not detect OS! Skipping."
	echo "Value recieved: $(detectOS)"
	;;
esac
