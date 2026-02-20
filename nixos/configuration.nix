{ config, pkgs, user, ... }:

{
  # Bootloader (Assumes a standard modern UEFI system)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;

  # Set your time zone
  time.timeZone = "Europe/London";

  # Define your user account
  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" ]; # 'wheel' grants sudo access
    # We set zsh as the default shell to match your mac
    shell = pkgs.zsh;
  };

  # Enable Zsh at the OS level so we can set it as the default shell above
  programs.zsh.enable = true;

  # Allow unfree packages (if you need proprietary drivers/apps later)
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System state version (DO NOT CHANGE this once installed)
  system.stateVersion = "23.11";
}
