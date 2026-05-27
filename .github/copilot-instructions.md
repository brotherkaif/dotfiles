# Copilot Instructions

This is a declarative, cross-platform system configuration managed by [Nix flakes](https://nixos.org/), [nix-darwin](https://github.com/LnL7/nix-darwin), and [Home Manager](https://github.com/nix-community/home-manager).

## Applying Changes

**macOS:**
```bash
sudo darwin-rebuild switch --flake .#<profile>
# Profiles: mac-mini, macbook-air, macbook-pro
```

**NixOS:**
```bash
sudo nixos-rebuild switch --flake .#<profile>
# Profiles: thinkcentre, thinkpad
```

**Update flake inputs (packages):**
```bash
nix flake update
# then run the rebuild command above
```

> Neovim config lives in `config/nvim/` and is symlinked live — edits take effect immediately without a rebuild. The config is adapted from [MiniMax](https://nvim-mini.org/MiniMax/index.html), a config generator built primarily around [mini.nvim](https://github.com/echasnovski/mini.nvim) modules. The files are extensively commented and meant to be read.

## Architecture

The entry point is `flake.nix`, which defines per-host configs and wires together three layers:

| Layer | Path | Purpose |
|---|---|---|
| System (macOS) | `darwin/default.nix` | nix-darwin: Homebrew, fonts, system packages, macOS settings |
| System (NixOS) | `nixos/configuration.nix` + `nixos/hosts/<host>/` | NixOS: bootloader, networking, user accounts, optional modules |
| User (all) | `home/default.nix` | Home Manager: shell, git, neovim, tmux, and other per-user tools |

**`packages.nix`** is the single source of truth for all packages — Nix packages (home + darwin system), Homebrew formulae/casks, and Mac App Store apps. Both `darwin/default.nix` and `home/default.nix` import it. Add/remove packages here, not inside individual module files.

`specialArgs` / `extraSpecialArgs` from `flake.nix` propagate two key values down to all modules:
- `user` — the username string for the host
- `isPersonal` — boolean controlling work vs. personal package sets

## Key Conventions

**Adding packages:** Edit `packages.nix`. Use `lib.optionals isPersonal [...]` for personal-only packages and `lib.optionals pkgs.stdenv.isLinux [...]` for Linux-only packages.

**Adding a new Home Manager module:** Create `home/<tool>.nix`, then import it in `home/default.nix`. Use `lib.optionals (!isPersonal) [ ./tool.nix ]` for conditional imports.

**Machine-local secrets and overrides** (SSH keys, tokens, machine-specific env vars) go in `~/.local-config`, which is sourced by both bash and zsh. This file is not tracked in the repo.

**All Darwin hosts share** the same `darwin/default.nix`; there is no per-host darwin directory. Host-specific macOS differences are handled via `isPersonal` or `specialArgs` in `flake.nix`.

**NixOS optional modules** (`gnome.nix`, `pipewire.nix`, `steam.nix`) are listed explicitly per host in `flake.nix` rather than being auto-imported — add them there when enabling a feature for a host.
