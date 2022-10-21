#           _
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__
#(_)___|___/_| |_|_|  \___|
#==========================

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

# PROMPT
PROMPT="%F{blue}%~"$'\n'"%F{yellow}%#%f "

# NODE PATH FIX DARWIN
export PATH="/usr/local/opt/node@14/bin:$PATH"
