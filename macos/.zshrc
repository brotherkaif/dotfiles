# Starship prompt (guard so a missing binary doesn't error on fresh shells)
command -v starship &> /dev/null && eval "$(starship init zsh)"
