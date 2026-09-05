# walker

**Status: not yet configured.**

This package is an empty placeholder for the Walker (Wayland app launcher)
config at `~/.config/walker/`. It is part of the **linux-desktop** stow set
(Omarchy machines only).

When a real `walker/` config exists on the source machine, copy it here as
`walker/.config/walker/...` so stow maps it onto `~/.config/walker/`.

> Note: if the live config contains symlinks into `~/.local/share/omarchy/`
> or `~/.local/state/omarchy/`, do **not** commit the symlink — copy the
> resolved file and replace the symlink, or exclude it and document it here.
