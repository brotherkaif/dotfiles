{ config, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Enable dconf for GNOME settings
  programs.dconf.enable = true;

  # Enable GNOME geolocation
  services.geoclue2.enable = true;

  # Force GNOME to use Adwaita and specific fonts on every login
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.interface]
    cursor-theme='Adwaita'
    font-name='Cantarell 11'
    monospace-font-name='Source Code Pro 10'

    [org.gnome.settings-daemon.plugins.color]
    night-light-enabled=true
    night-light-schedule-automatic=true
    night-light-temperature=3000
  '';

  # GNOME-specific packages
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
  ];

  # System-wide variables for the cursor
  environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };

  # Fonts required for the GNOME interface
  fonts.packages = with pkgs; [
    cantarell-fonts
    source-code-pro
  ];
}
