{ pkgs, lib, config, user, isPersonal, ... }:

{
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    git
    mkalias
    vim
  ];

  # Set primary user for nix-darwin
  system.primaryUser = user;

  # Spotlight indexing fix (For pure Nix GUI apps)
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = [ "/Applications" ]; # <-- Fixed!
    };
  in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';

  # Homebrew Packages
  homebrew = {
    enable = true;

    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    casks = [
      "appcleaner"
    ] ++ lib.optionals (isPersonal) [
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
