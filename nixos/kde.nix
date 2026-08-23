{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.excludePackages = [ pkgs.xterm ];

  programs.dconf.enable = true;
  services.geoclue2.enable = true;

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
    mouse.naturalScrolling = true;
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Noto Sans Mono" "Symbols Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };

  qt = {
    enable = true;
    platformTheme = "kde";
    style = "breeze";
  };

  environment.systemPackages = with pkgs; [
    kdePackages.akregator
    kdePackages.falkon
    kdePackages.dolphin
    kdePackages.konsole
    kdePackages.merkuro
    kdePackages.kdepim-runtime
    kdePackages.kdepim-addons
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.kate
    kdePackages.elisa
    kdePackages.kasts
    kdePackages.marknote
    kdePackages.plasma-systemmonitor
    kdePackages.partitionmanager
    kdePackages.marble
    kdePackages.kdeconnect-kde
    kdePackages.calligra
    digikam
    kdePackages.kdenlive
  ];
}
