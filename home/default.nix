{ config, pkgs, lib, user, isPersonal, ... }:

{
  imports = [
    ./git.nix
    ./nvim.nix
    ./shell.nix
    ./tmux.nix
  ] ++ lib.optionals (!isPersonal) [
    ./fnm.nix
  ];

  home.username = "${user}";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${user}" else "/home/${user}";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [ pip ]))
    bat
    chezmoi
    dust
    fastfetch
    ffmpeg
    fx
    fzf
    gh
    go
    jq
    lazygit
    stow
    tree
    wget
  ] ++ lib.optionals (isPersonal) [
    nodejs_24
    zellij
  ] ++ lib.optionals (pkgs.stdenv.isLinux) [
    kdePackages.falkon
    proton-pass
    protonmail-desktop
    protonvpn-gui
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
