{ config, pkgs, ... }:

{
  # 1. Core GNOME Services
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Remove xterm
  services.xserver.excludePackages = [ pkgs.xterm ];

  programs.dconf.enable = true;
  services.geoclue2.enable = true;

  # 2. GSettings Overrides
  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.mutter]
    experimental-features=['scale-monitor-framebuffer']

    [org.gnome.desktop.interface]
    accent-color='slate'
    cursor-theme='Adwaita'
    icon-theme='Adwaita'
    font-name='Adwaita 11'
    document-font-name='Adwaita 11'
    monospace-font-name='Adwaita Mono 11'

    [org.gnome.settings-daemon.plugins.color]
    night-light-enabled=true
    night-light-schedule-automatic=true

    [org.gnome.desktop.peripherals.touchpad]
    natural-scroll=true

    [org.gnome.desktop.peripherals.mouse]
    natural-scroll=true

    [org.gnome.desktop.wm.preferences]
    titlebar-font='Adwaita Bold 11'

    [org.gnome.Console]
    theme='auto'
  '';

  # 3. Fontconfig Logic
  fonts = {
    packages = with pkgs; [
      adwaita-fonts
      nerd-fonts.symbols-only
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Adwaita Mono" "Symbols Nerd Font" ];
        sansSerif = [ "Adwaita" ];
        serif = [ "Adwaita" ];
      };
    };
  };

  # 4. System Packages
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra
  ];
}
