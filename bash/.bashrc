if [ -f "/google/devshell/bashrc.google" ]; then
	source "/google/devshell/bashrc.google"
	source ~/.config/shell/.shell_aliases
	source ~/.config/shell/.shell_env
	source ~/.config/shell/.shell_motd
else
	source ~/.config/shell/.shell_tmux
	source ~/.config/shell/.shell_aliases
	source ~/.config/shell/.shell_env
	source ~/.config/shell/.shell_motd
fi

# PROMPT
export PS1="\[\e[34m\]\w\[\e[m\]\[\e[33m\]\n\\$\[\e[39m\] "
. "$HOME/.cargo/env"
