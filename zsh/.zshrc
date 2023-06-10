source ~/.config/shell/.shell_tmux
source ~/.config/shell/.shell_aliases
source ~/.config/shell/.shell_env
source ~/.config/shell/.shell_motd

# VIM MODE & CTRL-R fix
bindkey -v
bindkey '^r' history-incremental-search-backward

# PROMPT
PROMPT="%F{blue}%~"$'\n'"%F{yellow}%#%f "

# NODE PATH FIX DARWIN
export PATH="/usr/local/opt/node@14/bin:$PATH"

# RUST CONFIG
. "$HOME/.cargo/env"
