# source ~/.config/shell/.shell_tmux
source ~/.config/shell/.shell_aliases
source ~/.config/shell/.shell_env
source ~/.config/shell/.shell_motd

# VIM MODE & CTRL-R fix
bindkey -v
bindkey '^r' history-incremental-search-backward

# NODE PATH FIX DARWIN
export PATH="/usr/local/opt/node@14/bin:$PATH"

# MAC CONFIG
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# ENABLE STARSHIP
eval "$(starship init zsh)"

# ENABLE ZELLIJ
eval "$(zellij setup --generate-auto-start zsh)"
