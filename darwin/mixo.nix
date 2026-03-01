{ config, pkgs, user, ... }:

let
  mixoVersion = "2.2.0";

  mixoMac = pkgs.stdenv.mkDerivation rec {
    pname = "mixo";
    version = mixoVersion;

    src = pkgs.fetchurl {
      url = "https://www.mixo.dj/download/MIXO-${version}.dmg";
      sha256 = "03ri19m6daxfd4qsjqrwwjh3i4jpd9scmj11y4s8a4j1p9p72fnm";
    };

    nativeBuildInputs = [ pkgs.undmg ];
    sourceRoot = ".";

    installPhase = ''
      mkdir -p "$out/Applications"
      cp -R "MIXO.app" "$out/Applications/"
    '';
  };

in
{
  # Hand the app to nix-darwin so it gets properly linked into /Applications/Nix Apps
  environment.systemPackages = [ mixoMac ];
}
