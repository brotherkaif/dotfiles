# source ~/.config/shell/.shell_tmux
source ~/.config/shell/.shell_aliases
source ~/.config/shell/.shell_env
source ~/.config/shell/.shell_motd

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Only run the following in an interactive terminal session
if [ -t 1 ]; then
	# ENABLE STARSHIP
	eval "$(starship init bash)"

	# ENABLE ZELLIJ
	# eval "$(zellij setup --generate-auto-start bash)"
fi
