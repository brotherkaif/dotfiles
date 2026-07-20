# ❄️ Brother Kaif's Nix Dotfiles

A completely declarative, reproducible, and cross-platform system configuration managed by [Nix](https://nixos.org/), [nix-darwin](https://github.com/LnL7/nix-darwin), and [Home Manager](https://github.com/nix-community/home-manager). 

This configuration seamlessly handles package management, dotfile generation, and system settings across both macOS and NixOS machines.

## 🚀 Quickstart (Bootstrap)

This repository includes a single-command bootstrap script. It will automatically detect your operating system, install the Determinate Systems Nix package manager (if missing), clone this repository, and build your selected profile.

### 🍎 macOS (Clean Install)

1. Open the native **Terminal** app.
2. Run the following command:
   ```bash
   /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/brotherkaif/dotfiles/main/bootstrap.sh](https://raw.githubusercontent.com/brotherkaif/dotfiles/main/bootstrap.sh))"
	 ```

# ❄️ Brother Kaif's Nix Dotfiles

A completely declarative, reproducible, and cross-platform system configuration managed by [Nix](https://nixos.org/), [nix-darwin](https://github.com/LnL7/nix-darwin), and [Home Manager](https://github.com/nix-community/home-manager).

This configuration seamlessly handles package management, dotfile generation, and system settings across both macOS and NixOS machines.

## 🚀 Quickstart (Bootstrap)

This repository includes a single-command bootstrap script. It will automatically detect your operating system, install the Determinate Systems Nix package manager (if missing), clone this repository, and build your selected profile.

### 🍎 macOS (Clean Install)

1. Open the native **Terminal** app.
2. Run the following command:

 ```bash
 /bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/brotherkaif/dotfiles/main/bootstrap.sh](https://raw.githubusercontent.com/brotherkaif/dotfiles/main/bootstrap.sh))"
 ```

3. **Important for fresh Macs:** The script requires the Xcode Command Line Tools. If they are not installed, the script will trigger an Apple popup. Click "Install", wait for the process to finish, and then **run the curl command above one more time**.
4. When prompted by the script, enter your desired machine profile (e.g., `mac-mini`, `macbook-air`, `macbook-pro`).
5. Restart your terminal once the build completes.

### 🐧 NixOS (Clean Install)

1. Complete a standard NixOS installation and boot into your new user account.
2. Open your terminal.
3. Run the exact same bootstrap command:

```bash
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/brotherkaif/dotfiles/main/bootstrap.sh](https://raw.githubusercontent.com/brotherkaif/dotfiles/main/bootstrap.sh))"
```

4. When prompted, enter your NixOS machine profile (e.g., `thinkpad`, `thinkcentre`).
5. Restart your terminal once the build completes.

## 📁 Repository Structure

* `flake.nix`: The main entry point. Defines inputs and system/host configurations.
* `bootstrap.sh`: The setup script for fresh machines.
* `darwin/`: System-level configurations specific to macOS (fonts, system preferences).
* `nixos/`: System-level configurations specific to NixOS (hardware, bootloader, services).
* `home/`: User-level configurations managed by Home Manager (packages, CLI tools, shell settings).
* `config/`: Raw dotfiles (like Neovim Lua scripts) that are symlinked directly to maintain a standard development workflow.

## 🛠️ Applying Updates

To apply changes after editing files locally:

**On macOS:**

```bash
sudo darwin-rebuild switch --flake .#<profile-name>
```

**On NixOS:**

```bash
sudo nixos-rebuild switch --flake .#<profile-name>
```

To update your system packages to their latest versions:

```bash
nix flake update
# Then run your respective rebuild command above
```

## ⌨️ Tmux Keybindings

Prefix keys:

- `Ctrl-Space` (primary prefix)
- `Ctrl-b` (secondary prefix)

Prefix table bindings:

| Key | Action |
|---|---|
| `q` | Reload tmux config |
| `h` | Split pane vertically |
| `v` | Split pane horizontally |
| `x` | Kill pane |
| `r` | Rename window |
| `c` | New window (same cwd) |
| `k` | Kill window |
| `R` | Rename session |
| `C` | New session (same cwd) |
| `K` | Kill session |
| `P` | Previous session |
| `N` | Next session |

Global (no-prefix) bindings:

| Key | Action |
|---|---|
| `Alt-Enter` | Split pane vertically (same cwd) |
| `Alt-Shift-Enter` | Split pane horizontally (same cwd) |
| `Alt-Escape` | Kill pane |
| `Ctrl-Alt-Left/Right/Up/Down` | Move between panes |
| `Ctrl-Alt-Shift-Left/Right/Up/Down` | Resize pane by 5 |
| `Alt-1..9` | Jump to window 1..9 |
| `Alt-Left/Right` | Previous/next window |
| `Alt-Shift-Left/Right` | Swap window left/right and select it |
| `Alt-Up/Down` | Previous/next session |

Copy mode (`copy-mode-vi`):

| Key | Action |
|---|---|
| `v` | Begin selection |
| `y` | Copy selection and exit copy mode |
| `Enter` | Copy selection and exit copy mode |
| `MouseDragEnd1Pane` | Copy selection and exit copy mode |
