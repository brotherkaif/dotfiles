{ config, pkgs, pkgs-unstable, ... }:

{
  # Install neovim 0.12 directly from unstable, bypassing home-manager's
  # wrapper (which is incompatible with the unstable package structure).
  home.packages = [
    pkgs-unstable.neovim
  ] ++ (with pkgs; [
    ripgrep
    fd
    cargo
    jdk
    phpPackages.composer
    php
    pv
    julia-bin
    luarocks
  ]);

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
}
