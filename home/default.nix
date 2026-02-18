{ config, pkgs, ... }:

{
  home.username = "kaifahmed";
  home.homeDirectory = "/Users/kaifahmed";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [ pip ]))
    bat
    cargo
    chezmoi
    dust
    fastfetch
    fd
    ffmpeg
    fx
    fzf
    gh
    go
    jdk
    jq
    julia-bin
    lazygit
    luarocks
    neovim
    nodejs
    php
    phpPackages.composer
    pv
    ripgrep
    stow
    tree
    wget
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
