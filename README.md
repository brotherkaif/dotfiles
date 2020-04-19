# .dotfiles
The dotfiles of Brother Kaif. Includes installation scripts that automatically installs packages and updates configuration files.

## supported systems
- Darwin (macOS)
- Debian Buster (Chrome OS, Ubuntu, Debian, Windows)
- Arch (Arch, Manjaro)

## installed packages
### tools
- node (via nvm/homebrew)
- stow
- tree
- htop
- git
- tmux
- vim
- irssi
### applications
- docker
- vscode + settings sync plugin
### stupid terminal nonsense
- figlet
- toilet
- mplayer
- cool-retro-term

## setup
### add keys to github
SSH keys need to be added to GitHub via [github.com/settings/ssh](https://github.com/settings/ssh).

**Generate Keys**
```bash
mkdir -p ~/.ssh && ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/id_ed25519 -C "hello@kaif.me"
```

**Retrieve Public Key**
```bash
cat ~/.ssh/id_ed25519.pub
```

**Test GitHub Key Config**
```bash
ssh -T git@github.com
```
