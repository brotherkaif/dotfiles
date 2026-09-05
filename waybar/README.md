# waybar

**Status: not yet configured.**

This package is an empty placeholder for the Waybar (Wayland status bar) config
at `~/.config/waybar/`. It is part of the **linux-desktop** stow set (Omarchy
machines only).

When a real `waybar/` config exists on the source machine, copy it here as
`waybar/.config/waybar/...` so stow maps it onto `~/.config/waybar/`.

> Note: if the live config contains symlinks into `~/.local/share/omarchy/`
> or `~/.local/state/omarchy/` (e.g. a theme `style.css`), do **not** commit
> the symlink — copy the resolved file and replace the symlink, or exclude it
> and document it here.
