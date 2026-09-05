# uwsm

**Status: not yet configured.**

This package is an empty placeholder for the UWSM (Universal Wayland Session
Manager) config at `~/.config/uwsm/`. It is part of the **linux-desktop** stow
set (Omarchy machines only).

When a real `uwsm/` config exists on the source machine, copy it here as
`uwsm/.config/uwsm/...` so stow maps it onto `~/.config/uwsm/`.

> Note: if the live config contains symlinks into `~/.local/share/omarchy/`
> or `~/.local/state/omarchy/`, do **not** commit the symlink — copy the
> resolved file and replace the symlink, or exclude it and document it here.
