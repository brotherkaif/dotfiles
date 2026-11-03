#!/usr/bin/env bash

# Find where the script is located to reference the python script reliably
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Verify python3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is required but could not be found in your PATH." >&2
    echo "Please ensure python3 is installed on your system (macOS or NixOS)." >&2
    exit 1
fi

# Run the python script with all arguments passed through
python3 "${SCRIPT_DIR}/prepare_playlist.py" "$@"
