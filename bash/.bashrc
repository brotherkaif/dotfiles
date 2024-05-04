# source ~/.config/shell/.shell_tmux
source ~/.config/shell/.shell_aliases
source ~/.config/shell/.shell_env
source ~/.config/shell/.shell_motd

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# PROMPT
export PS1="\[\e[33m\]\w\[\e[m\]\[\e[31m\]\n\\$\[\e[39m\] "
