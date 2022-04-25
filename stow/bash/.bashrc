#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__
#(_)_.__/ \__,_|___/_| |_|_|  \___|
#==================================

# SOURCE COMMON
if [ -f ~/.shell_common ]; then
    source ~/.shell_common
fi

# SOURCE ALIASES
if [ -f ~/.shell_aliases ]; then
    source ~/.shell_aliases
fi

## source config
if [ -f "/google/devshell/bashrc.google" ]; then
    source "/google/devshell/bashrc.google"
fi

# PROMPT
export PS1="\[\e[33m\]\w\[\e[m\]\[\e[34m\]\n\\$\[\e[39m\] "

# NVM SETUP
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
