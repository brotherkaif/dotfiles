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

# MAC CONFIG
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# ENABLE STARSHIP
eval "$(starship init bash)"

# ENABLE ZELLIJ
eval "$(zellij setup --generate-auto-start bash)"
