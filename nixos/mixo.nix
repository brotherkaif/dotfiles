{ config, pkgs, user, ... }:

let
  mixoVersion = "2.2.0";
  mixoPname = "mixo";

  # 1. THE SOURCE: Defined once so both tools can share it
  mixoSrc = pkgs.fetchurl {
    url = "https://www.mixo.dj/download/MIXO-${mixoVersion}.AppImage";
    sha256 = "sha256-HTfVkLFYDTgT/TJjB1xbNd/rzKNoLMJnoYwHZKNw7vc=";
  };

  # 2. THE EXTRACTOR: Cracks open the AppImage to get the internal files
  appimageContents = pkgs.appimageTools.extractType2 {
    pname = mixoPname;
    version = mixoVersion;
    src = mixoSrc;
  };

  # 3. THE WRAPPER: The Mixo AppImage derivation
  mixo = pkgs.appimageTools.wrapType2 {
    pname = mixoPname;
    version = mixoVersion;
    src = mixoSrc;

    # Mixo relies on this older OpenSSL library to launch successfully
    extraPkgs = p: with p; [ openssl_1_1 ];

    # Grab the .DirIcon from the extracted contents and install it to your system icons
    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/.DirIcon $out/share/icons/hicolor/512x512/apps/mixo.png
    '';
  };

  # 4. THE SHORTCUT: Create a desktop shortcut so you don't have to launch it from the terminal
  mixoDesktop = pkgs.makeDesktopItem {
    name = "Mixo";
    desktopName = "MIXO";
    exec = "mixo";
    icon = "mixo"; # <-- Tells your app launcher to use the icon we just extracted!
    terminal = false;
    categories = [ "AudioVideo" "Audio" ];
  };

in
{
  # 1. OS-LEVEL CONFIGURATION
  # Because Mixo requires the older openssl_1_1, we must explicitly allow
  # this insecure package at the system level so the build doesn't fail.
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  # 2. USER-LEVEL CONFIGURATION
  # This installs the custom Mixo package we defined above for your user
  home-manager.users.${user} = {
    home.packages = [
      mixo
      mixoDesktop
    ];
  };
}
