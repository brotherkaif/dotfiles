# macos

**Status: not yet configured.**

This package is stowed **only on macOS** machines (never on Omarchy/Linux).
Place anything darwin-specific here, mapped onto `$HOME`, e.g.:

- `macos/.config/...` → `~/.config/...` (macOS-only app configs)
- `macos/.zprofile` → `~/.zprofile` (shell env for Darwin, when zsh is set up)
- anything else macOS-specific

Only user-owned, non-secret config belongs here. See the root `README.md` for
the per-OS stow sets and the `bootstrap.sh` OS detection logic.
