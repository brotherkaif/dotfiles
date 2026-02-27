{ config, pkgs, user, ... }:

{
  # 1. OS-LEVEL CONFIGURATION
  # This sets up the drivers, firewall, and udev rules
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # 2. USER-LEVEL CONFIGURATION
  # This installs your user packages like protonup-qt
  home-manager.users.${user} = {
    home.packages = [
      pkgs.protonup-qt
    ];
  };
}
