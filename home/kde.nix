{ config, lib, pkgs, ... }:

with lib;

mkIf (!pkgs.stdenv.isDarwin) {
  home.file.".config/kwinrc".text = ''
    [NightColor]
    Active=true
    Mode=auto
    TemperatureDay=6500
    TemperatureNight=4000

    [Tiling]
    padding=8
  '';
}
