# bin

Cross-platform personal scripts that belong in `~/.local/bin/` on every machine.

This package is part of the **universal** stow set, so it is stowed on macOS and
Linux/Omarchy alike.

Put scripts here as `bin/.local/bin/<name>` so stow maps them onto
`~/.local/bin/<name>`. Keep the executable bit set (`chmod +x`) so they are
runnable after stowing.

Only user-owned, non-secret scripts belong here. Never commit anything
machine-identifying or secret (tokens, keys, `.netrc`).

Scripts that are Linux/Omarchy-specific should go in the `omarchy-local`
package instead.
