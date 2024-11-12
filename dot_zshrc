# source ~/.config/shell/.shell_tmux
source ~/.config/shell/.shell_aliases
source ~/.config/shell/.shell_env
source ~/.config/shell/.shell_motd

# local config
if [ -f "$HOME/.local-config" ]; then
  source "$HOME/.local-config"
fi

# VIM MODE & CTRL-R fix
bindkey -v
bindkey '^r' history-incremental-search-backward

# PROMPT
PROMPT="%B%~%b"$'\n'"%# "
