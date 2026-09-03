{ config, lib, pkgs, isSteamOS ? false, ... }:

with lib;

mkIf (!pkgs.stdenv.isDarwin && !isSteamOS) {
  home.file.".local/share/applications/org.kde.merkuro.mail.desktop" = {
    force = true;
    text = ''
      [Desktop Entry]
      Name=Merkuro Mail
      GenericName=Email Client
      Comment=Manage your e-mails with Merkuro Mail
      Exec=merkuro-mail %U
      Icon=org.kde.merkuro.mail
      Type=Application
      Categories=Qt;KDE;Office;Email;
      Terminal=false
      StartupNotify=true
      SingleMainWindow=true
      MimeType=message/rfc822;x-scheme-handler/mailto;
    '';
  };

  home.file.".local/share/applications/proton-pass.desktop" = {
    force = true;
    text = ''
      [Desktop Entry]
      Name=Proton Pass
      GenericName=Password Manager
      Comment=Proton Pass desktop application
      Exec=proton-pass %U
      Icon=proton-pass
      Type=Application
      Categories=Utility;
      Terminal=false
      StartupNotify=true
      StartupWMClass=Proton Pass
      SingleMainWindow=true
    '';
  };

  home.file.".local/share/applications/proton-mail.desktop" = {
    force = true;
    text = ''
      [Desktop Entry]
      Name=Proton Mail
      GenericName=Email Client
      Comment=Proton official desktop application for Proton Mail and Proton Calendar
      Exec=proton-mail %U
      Icon=proton-mail
      Type=Application
      Categories=Network;Email;
      Terminal=false
      StartupNotify=true
      StartupWMClass=Proton Mail
      SingleMainWindow=true
      MimeType=x-scheme-handler/mailto;
    '';
  };

  home.file.".config/konsolerc" = {
    force = true;
    text = ''
      [Desktop Entry]
      DefaultProfile=Vapor.profile
    '';
  };

  home.file.".local/share/konsole/Vapor.profile" = {
    force = true;
    text = ''
      [Appearance]
      ColorScheme=Vapor

      [General]
      Name=Vapor
      Parent=FALLBACK/
    '';
  };

  home.file.".local/share/konsole/Vapor.colorscheme" = {
    force = true;
    text = ''
      [Background]
      Color=21,27,33

      [BackgroundFaint]
      Color=22,32,45

      [BackgroundIntense]
      Color=19,46,69

      [Color0]
      Color=21,27,33

      [Color0Faint]
      Color=49,54,59

      [Color0Intense]
      Color=127,140,141

      [Color1]
      Color=237,21,21

      [Color1Faint]
      Color=120,50,40

      [Color1Intense]
      Color=192,57,43

      [Color2]
      Color=71,146,176

      [Color2Faint]
      Color=52,108,146

      [Color2Intense]
      Color=171,207,228

      [Color3]
      Color=246,116,0

      [Color3Faint]
      Color=182,86,25

      [Color3Intense]
      Color=253,188,75

      [Color4]
      Color=29,153,243

      [Color4Faint]
      Color=27,102,143

      [Color4Intense]
      Color=61,174,233

      [Color5]
      Color=155,89,182

      [Color5Faint]
      Color=97,74,115

      [Color5Intense]
      Color=142,68,173

      [Color6]
      Color=227,255,194

      [Color6Faint]
      Color=91,118,56

      [Color6Intense]
      Color=141,189,85

      [Color7]
      Color=239,240,241

      [Color7Faint]
      Color=99,104,109

      [Color7Intense]
      Color=252,252,252

      [Foreground]
      Color=239,240,241

      [ForegroundFaint]
      Color=220,230,231

      [ForegroundIntense]
      Color=252,252,252

      [General]
      Description=SteamOS
      Opacity=0.9
      Wallpaper=
    '';
  };
}
