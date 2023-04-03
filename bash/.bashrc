# SOURCE COMMON
if [ -f ~/.shell_common ]; then
    source ~/.shell_common
fi

# SOURCE ALIASES
if [ -f ~/.shell_aliases ]; then
    source ~/.shell_aliases
fi

# PROMPT
export PS1="\[\e[34m\]\w\[\e[m\]\[\e[33m\]\n\\$\[\e[39m\] "
