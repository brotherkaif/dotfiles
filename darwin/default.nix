{ pkgs, ... }:

{
  # System-wide packages (keep minimal here, put user apps in home-manager)
  environment.systemPackages = with pkgs; [
    # These are critical for the system to function
    git
    vim
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  # Nix Configuration
  nix.settings.experimental-features = "nix-command flakes";

  # Enable Zsh (required for MacOS to not complain, even if you use Fish/Bash)
  programs.zsh.enable = true;

  # System State Version
  system.stateVersion = 6;

  # Platform
  nixpkgs.hostPlatform = "aarch64-darwin";
}
