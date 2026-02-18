{ config, pkgs, user, ... }:

{
  home.username = "${user}";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${user}" else "/home/${user}";

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
