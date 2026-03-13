{ pkgs, user, lib, isPersonal, ... }:

{
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
  };

  system.primaryUser = "${user}";

  # System-wide packages
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  environment.systemPath = [ "/opt/homebrew/bin" ];

  # Homebrew Packages
  homebrew = {
    enable = true;

    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    casks = lib.optionals (isPersonal) [
      "appcleaner"
      "netnewswire"
      "proton-drive"
      "proton-mail"
      "proton-pass"
      "protonvpn"
      "steam"
    ];

    # Mac App Store Applications
    masApps = {
      # Installed on both Work and Personal machines
      "Ghostery" = 6504861501;
      "JSON Peep for Safari" = 1458969831;
    } // lib.optionalAttrs (isPersonal) {
      # Installed ONLY on Personal machines
      "Proton Pass for Safari" = 6502835663;
      "djay - DJ App & AI Mixer" = 450527929;
    };
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
