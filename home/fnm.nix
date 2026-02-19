{ config, pkgs, ... }:

{
  programs.fnm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
