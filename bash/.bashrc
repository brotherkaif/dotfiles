# source ~/.config/shell/.shell_tmux
source ~/.config/shell/.shell_aliases
source ~/.config/shell/.shell_env
source ~/.config/shell/.shell_motd

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# MAC CONFIG
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# ENABLE STARSHIP
eval "$(starship init bash)"

# ENABLE ZELLIJ
eval "$(zellij setup --generate-auto-start bash)"
