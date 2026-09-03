{ config, pkgs, lib, ... }:

{
  programs.plasma = {
    enable = true;
    overrideConfig = false;

    workspace = {
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Nuvole";
      wallpaperFillMode = "stretch";
    };

    # Day/night theme switching (Plasma 6.5 native).
    # Do NOT use workspace.lookAndFeel here: plain `plasma-apply-lookandfeel -a`
    # resets AutomaticLookAndFeel to false, silently disabling auto-switching.
    # Nuvole ships contents/images_dark, so its wallpaper follows the theme.
    configFile."kdeglobals"."KDE" = {
      LookAndFeelPackage.value = "org.kde.breeze.desktop";
      DefaultLightLookAndFeel.value = "org.kde.breeze.desktop";
      DefaultDarkLookAndFeel.value = "org.kde.breezedark.desktop";
      AutomaticLookAndFeel.value = true;
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

    configFile."kwinrc" = {
      "NightColor" = {
        Active.value = true;
        Mode.value = "auto";
        TemperatureDay.value = 6500;
        TemperatureNight.value = 4000;
      };
      "Tiling" = {
        padding.value = 8;
      };
    };

    # Proton Pass / Proton Mail are Electron apps that present the generic
    # Wayland app_id "electron", so KDE's task manager cannot map their running
    # window to the matching .desktop file and shows a generic icon. Forcing the
    # desktop-file association makes the taskbar use the app's real icon.
    window-rules = [
      {
        match = {
          title = { value = "Proton Pass"; type = "substring"; };
          window-class = { value = "electron"; type = "exact"; };
        };
        apply = {
          desktopfile = { value = "proton-pass"; apply = "force"; };
        };
        description = "Proton Pass taskbar icon";
      }
      {
        match = {
          title = { value = "Proton Mail"; type = "substring"; };
          window-class = { value = "electron"; type = "exact"; };
        };
        apply = {
          desktopfile = { value = "proton-mail"; apply = "force"; };
        };
        description = "Proton Mail taskbar icon";
      }
    ];

    # Per-device natural scrolling. Identifiers come from:
    #   awk '/^N: Name=/{n=$0} /^I: Bus=/{if(n~/[Tt]ouch|[Mm]ouse/) print n"\n"$0}' /proc/bus/input/devices
    # vendorId/productId are the hex Vendor=/Product= fields.
    input.mice = [
      {
        name = "Logitech USB Receiver Mouse";
        vendorId = "046d";
        productId = "c548";
        naturalScroll = true;
      }
    ];
    input.touchpads = [
      {
        name = "SYNA8018:00 06CB:CE67 Touchpad";
        vendorId = "06cb";
        productId = "ce67";
        naturalScroll = true;
      }
    ];
  };
}
