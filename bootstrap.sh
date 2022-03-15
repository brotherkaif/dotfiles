#!/bin/bash
echo "┌───────────────────────────┐"
echo "│▛▀▖▞▀▖▞▀▖▀▛▘▞▀▖▀▛▘▛▀▖▞▀▖▛▀▖│"
echo "│▙▄▘▌ ▌▌ ▌ ▌ ▚▄  ▌ ▙▄▘▙▄▌▙▄▘│"
echo "│▌ ▌▌ ▌▌ ▌ ▌ ▖ ▌ ▌ ▌▚ ▌ ▌▌  │"
echo "│▀▀ ▝▀ ▝▀  ▘ ▝▀  ▘ ▘ ▘▘ ▘▘  │"
echo "└───────────────────────────┘"

sh scripts/install_neovim.sh
sh scripts/symlink_config.sh
