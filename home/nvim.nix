{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
      cargo
      jdk
      phpPackages.composer
      php
      pv
      julia-bin
      luarocks
      # lua-language-server
      # nil # Nix LSP
      # stylua
      # Add others (node, python, go, etc.) as needed by your plugins
    ];
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
}
