{ config, pkgs, user, ... }:

let
  mixoVersion = "1.90.0"; # Update if needed

  mixoMac = pkgs.stdenv.mkDerivation rec {
    pname = "mixo";
    version = mixoVersion;

    src = pkgs.fetchurl {
      url = "https://download.mixo.dj/MIXO-${version}.dmg";
      sha256 = pkgs.lib.fakeSha256; # We will update this dummy hash in a moment
    };

    # undmg is the utility Nix uses to extract macOS disk images
    nativeBuildInputs = [ pkgs.undmg ];

    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/Applications/MIXO.app
      cp -R "MIXO.app" "$out/Applications/MIXO.app"
    '';
  };

in
{
  # Install the app for your user. Home Manager will automatically symlink
  # this into ~/Applications/Home Manager Apps/MIXO.app
  home-manager.users.${user} = {
    home.packages = [ mixoMac ];
  };
}
