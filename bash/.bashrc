if [ -f "/google/devshell/bashrc.google" ]; then
	source "/google/devshell/bashrc.google"
	source ~/.config/shell/.shell_aliases
	source ~/.config/shell/.shell_env
	source ~/.config/shell/.shell_motd
else
	# source ~/.config/shell/.shell_tmux
	source ~/.config/shell/.shell_aliases
	source ~/.config/shell/.shell_env
	source ~/.config/shell/.shell_motd
fi

# RUST CONFIG
. "$HOME/.cargo/env"

# MAC CONFIG
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# ENABLE STARSHIP
eval "$(starship init bash)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/brotherkaif/dotfiles/scripts/google-cloud-sdk/path.bash.inc' ]; then . '/home/brotherkaif/dotfiles/scripts/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/brotherkaif/dotfiles/scripts/google-cloud-sdk/completion.bash.inc' ]; then . '/home/brotherkaif/dotfiles/scripts/google-cloud-sdk/completion.bash.inc'; fi
