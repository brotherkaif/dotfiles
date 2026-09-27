# macOS ~/.zprofile  (login shells)
#
# Runs path_helper to build PATH from /etc/paths and /etc/paths.d/* (which on a
# Homebrew install includes /etc/paths.d/homebrew containing /opt/homebrew/bin).
# This is what puts `brew` (and everything installed via brew) on PATH.
#
# Why this lives here: on stock macOS, /etc/zprofile runs path_helper for zsh
# login shells. On this machine nix-darwin had overwritten /etc/zprofile, and
# the Nix removal deleted that generated version, leaving no /etc/zprofile at
# all — so path_helper never ran and /opt/homebrew/bin was never added to PATH
# (brew was correctly installed but not on PATH). Carrying this in the dotfiles
# repo (in the macos stow package) makes the setup self-contained on a fresh
# install instead of depending on /etc/zprofile being present.
#
# Sourcing order on a macOS login interactive zsh:
#   /etc/zprofile  (Apple stock; if present — also runs path_helper)
#   ~/.zprofile    (this file)
#   /etc/zshrc     (Apple stock; if present)
#   ~/.zshrc       (interactive defaults + Starship prompt)
#
# path_helper is idempotent-friendly: it prepends any paths not already on PATH,
# so running it twice (once from /etc/zprofile, once here) is harmless.

# Default locale if none is set yet (matches Apple's stock /etc/zprofile).
if [ -z "$LANG" ]; then
    export LANG=C.UTF-8
fi

# Build PATH from /etc/paths and /etc/paths.d/* (adds /opt/homebrew/bin on brew installs).
if [ -x /usr/libexec/path_helper ]; then
    eval "$(/usr/libexec/path_helper -s)"
fi
