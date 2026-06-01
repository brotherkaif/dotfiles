{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;

    settings = {
      theme = "ansi";
    };
  };
}
