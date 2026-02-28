{ config, pkgs, user, ... }:

let
  mixoVersion = "1.90.0"; # Update this to the current version

  # The Mixo AppImage derivation
  mixo = pkgs.appimageTools.wrapType2 rec {
    pname = "mixo";
    version = mixoVersion;

    src = pkgs.fetchurl {
      url = "https://download.mixo.dj/MIXO-${version}.AppImage";
      sha256 = pkgs.lib.fakeSha256; # Replace this with the actual hash after your first run
    };

    # Mixo relies on this older OpenSSL library to launch successfully
    extraPkgs = p: with p; [ openssl_1_1 ];
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
    ];
  };
}
