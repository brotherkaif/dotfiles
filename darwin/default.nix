{ pkgs, user, ... }:

{
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  # Homebrew Packages
  homebrew = {
    enable = true;

    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    casks = lib.optionals (isPersonal) [
      "steam"
    ];
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  # Nix Configuration
  nix.enable = false;

  # Enable Zsh (required for MacOS to not complain, even if you use Fish/Bash)
  programs.zsh.enable = true;

  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
