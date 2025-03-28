# source ~/.config/shell/.shell_tmux
source ~/.config/shell/.shell_aliases
source ~/.config/shell/.shell_env
source ~/.config/shell/.shell_motd

# local config
if [ -f "$HOME/.local-config" ]; then
  source "$HOME/.local-config"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# PROMPT
export PS1="\[\e[1m\w\]\n\$ \[\e[0m\]"
