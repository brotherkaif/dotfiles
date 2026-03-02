{ config, pkgs, ... }:

{
  # 1. Core GNOME Services
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  programs.dconf.enable = true;
  services.geoclue2.enable = true;

  # 2. GSettings Overrides (The essentials)
  services.desktopManager.gnome.extraGSettingsOverridePackages = [ pkgs.mutter ];
  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.mutter]
    experimental-features=['scale-monitor-framebuffer']

    [org.gnome.desktop.interface]
    cursor-theme='Adwaita'
    icon-theme='Adwaita'
    font-name='Cantarell 11'
    monospace-font-name='Source Code Pro 10'

    [org.gnome.settings-daemon.plugins.color]
    night-light-enabled=true
    night-light-schedule-automatic=true
  '';

  # 3. System Packages
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra
  ];

  # 4. Fonts
  fonts.packages = with pkgs; [
    cantarell-fonts
    source-code-pro
  ];
}
