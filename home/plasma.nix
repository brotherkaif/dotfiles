{ config, pkgs, lib, ... }:

{
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Nuvole";
      wallpaperFillMode = "stretch";
    };

    panels = [{
      location = "bottom";
      floating = true;
      hiding = "dodgewindows";
      height = 44;
      widgets = [
        { name = "org.kde.plasma.kickoff"; }
        { name = "org.kde.plasma.pager"; }
        { iconTasks = { }; }
        { name = "org.kde.plasma.marginsseparator"; }
        { systemTray = {
            items = {
              shown = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.notifications"
                "org.kde.plasma.devicenotifier"
                "org.kde.plasma.keyboardindicator"
                "org.kde.plasma.manage-inputmethod"
                "org.kde.plasma.weather"
                "org.kde.plasma.mediacontroller"
                "org.kde.plasma.brightness"
                "org.kde.kscreen"
              ];
            };
          };
        }
        { digitalClock = { }; }
        { name = "org.kde.plasma.showdesktop"; }
      ];
    }];

    fonts = {
      general = { family = "Noto Sans"; pointSize = 10; };
      fixedWidth = { family = "JetBrains Mono"; pointSize = 10; };
    };

    kscreenlocker = {
      appearance = {
        wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Nuvole";
      };
      lockOnResume = true;
      timeout = 600;
    };

    startup.desktopScript."wallpaper-dynamic-mode" = {
      text = ''
        let allDesktops = desktops();
        for (const desktop of allDesktops) {
            desktop.wallpaperPlugin = "org.kde.image";
            desktop.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
            desktop.writeConfig("Image", "file://${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Nuvole");
            desktop.writeConfig("DynamicMode", "day-night");
            desktop.writeConfig("FillMode", "stretch");
        }
      '';
      priority = 4;
    };

    startup.desktopScript."auto-look-and-feel" = {
      text = ''
        let kdeglobals = ConfigFile("kdeglobals");
        kdeglobals.writeEntry("KDE", "AutomaticLookAndFeel", true);
        kdeglobals.writeEntry("KDE", "LookAndFeelPackage", "org.kde.breezedark.desktop");
      '';
      priority = 5;
    };

    startup.desktopScript."kwin-settings" = {
      text = ''
        let kwinrc = ConfigFile("kwinrc");
        kwinrc.writeEntry("NightColor", "Active", true);
        kwinrc.writeEntry("NightColor", "Mode", "auto");
        kwinrc.writeEntry("NightColor", "TemperatureDay", 6500);
        kwinrc.writeEntry("NightColor", "TemperatureNight", 4000);
        kwinrc.writeEntry("Tiling", "padding", 8);
      '';
      priority = 6;
    };
  };
}