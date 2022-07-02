#!/bin/bash
echo "┌───────────────────────────┐"
echo "│▛▀▖▞▀▖▞▀▖▀▛▘▞▀▖▀▛▘▛▀▖▞▀▖▛▀▖│"
echo "│▙▄▘▌ ▌▌ ▌ ▌ ▚▄  ▌ ▙▄▘▙▄▌▙▄▘│"
echo "│▌ ▌▌ ▌▌ ▌ ▌ ▖ ▌ ▌ ▌▚ ▌ ▌▌  │"
echo "│▀▀ ▝▀ ▝▀  ▘ ▝▀  ▘ ▘ ▘▘ ▘▘  │"
echo "└───────────────────────────┘"

display_message () {
	echo -e "[$1]"
}

# usage: $1=stow-dir $2=cleanup-callback
symlink_dotfiles () {
	display_message $1
	echo "Tidying up existing $1 config..."
	$2
	echo "Symlinking $1..."
	stow --dir=$HOME/dotfiles --target=$HOME --no-folding $1
	echo "...done!"
}

# usage: call
sync_submodules() {
	git submodule deinit --all -f
	git submodule init
	git submodule update
}

display_message SYMLINKING
symlink_dotfiles bash $(rm -rf $HOME/.bash* && rm -rf $HOME/.inputrc)
symlink_dotfiles devdocs $(rm -rf $XDG_CONFIG_HOME/customisation/devdocs)
symlink_dotfiles git $(rm -rf $HOME/.gitconfig && rm -rf $XDG_CONFIG_HOME/git)
symlink_dotfiles lazygit $(rm -rf $XDG_CONFIG_HOME/lazygit)
symlink_dotfiles monero $(rm -rf $HOME/.bitmonero)
symlink_dotfiles newsboat $(rm -rf $XDG_CONFIG_HOME/newsboat)
symlink_dotfiles lynx $(rm -rf $HOME/.lynx*)
symlink_dotfiles nvim $(rm -rf $XDG_CONFIG_HOME/nvim && rm -rf $XDG_DATA_HOME/nvim)
symlink_dotfiles scripts $(rm -rf $HOME/bin)
symlink_dotfiles shell $(rm -rf $HOME/.shell*)
symlink_dotfiles themes $(rm -rf $XDG_CONFIG_HOME/customisation/macos-terminal-themes)
symlink_dotfiles tmux $(rm -rf $HOME/.tmux*)
symlink_dotfiles vim $(rm -rf $HOME/.vim)
symlink_dotfiles zsh $(rm -rf $HOME/.zsh*)

display_message SYNCING
sync_submodules
