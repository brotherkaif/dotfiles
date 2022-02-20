#           _
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__
#(_)___|___/_| |_|_|  \___|
#==========================
# ADDED VIA ANSIBLE

# SOURCE COMMON
if [ -f ~/.shell_common ]; then
   source ~/.shell_common
fi

# SOURCE ALIASES
if [ -f ~/.shell_aliases ]; then
   source ~/.shell_aliases
fi

# VIM MODE & CTRL-R fix
bindkey -v
bindkey '^r' history-incremental-search-backward

# TMUX AUTO LOAD
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#     tmux -2 attach -t TERM || tmux -2 new -s TERM
# fi

# MOTD
clear
echo -e "\e[43;30m CONSOLE \e[0m"

# PROMPT
PROMPT="%F{red}%~"$'\n'"%F{blue}%#%f "

# NODE PATH FIX DARWIN
export PATH="/usr/local/opt/node@14/bin:$PATH"

# NVM SETUP
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
