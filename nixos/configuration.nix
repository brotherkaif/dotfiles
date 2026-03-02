{ config, pkgs, user, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;
  hardware.graphics.enable = true;

  # Set your time zone
  time.timeZone = "Europe/London";

  # Define your user account
  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # General system packages (non-GNOME specific)
  environment.systemPackages = with pkgs; [
    nixos-render-docs
  ];

  system.stateVersion = "23.11";
}
