# source ~/.config/shell/.shell_tmux
source ~/.config/shell/.shell_aliases
source ~/.config/shell/.shell_env
source ~/.config/shell/.shell_motd

# VIM MODE & CTRL-R fix
bindkey -v
bindkey '^r' history-incremental-search-backward

# Only run the following in an interactive terminal session
if [ -t 1 ]; then
	# ENABLE STARSHIP
	eval "$(starship init zsh)"

	# ENABLE ZELLIJ
	# eval "$(zellij setup --generate-auto-start zsh)"
fi
