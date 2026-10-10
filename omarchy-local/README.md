# omarchy-local

This package is the home for *personal* scripts/binaries that belong in
`~/.local/bin/` on Omarchy (Linux/Wayland) machines only. It is part of the
**linux-desktop** stow set.

Put scripts here as `omarchy-local/.local/bin/<name>` so stow maps them onto
`~/.local/bin/<name>`.

Scripts that need to be available on macOS too should go in the `bin` package
instead, which is part of the universal stow set.

Only user-owned, non-secret scripts belong here. Never commit anything
machine-identifying or secret (tokens, keys, `.netrc`).
