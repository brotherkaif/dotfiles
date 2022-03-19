#!/bin/bash
display_message () {
	echo -e "\e[43;30m $1 \e[0m"
}

# usage: $1=stow-dir $2=cleanup-callback
symlink () {
	display_message $1
	echo "Tidying up existing $1 config..."
	$2
	echo "Symlinking $1..."
	stow --dir=$HOME/dotfiles/stow --target=$HOME --no-folding $1
	echo "...done!"
}

display_message SYMLINKING

symlink bash $(rm -rf $HOME/.bash* && rm -rf $HOME/.inputrc)
symlink devdocs $(rm -rf $XDG_CONFIG_HOME/customisation/devdocs)
symlink git $(rm -rf $HOME/.gitconfig && rm -rf $XDG_CONFIG_HOME/git)
symlink lazygit $(rm -rf $XDG_CONFIG_HOME/lazygit)
symlink monero $(rm -rf $HOME/.bitmonero)
symlink newsboat $(rm -rf $XDG_CONFIG_HOME/newsboat)
symlink nvim $(rm -rf $XDG_CONFIG_HOME/nvim && rm -rf $XDG_DATA_HOME/nvim)
symlink shell $(rm -rf $HOME/.shell*)
symlink themes $(rm -rf $XDG_CONFIG_HOME/customisation/macos-terminal-themes)
symlink tmux $(rm -rf $HOME/.tmux*)
symlink zsh $(rm -rf $HOME/.zsh*)
