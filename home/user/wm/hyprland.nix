{
  pkgs,
  inputs,
  config,
  ...
}:

let
  orchisTheme = pkgs.orchis-theme;
  orchisName = "Orchis-Purple-Dark";
in
{
  imports = [ inputs.noctalia.homeModules.default ];

  home.pointerCursor = {
    name = "catppuccin-macchiato-blue-cursors";
    package = pkgs.catppuccin-cursors.macchiatoBlue;
    size = 24;
    gtk.enable = true;
  };

  gtk = {
    enable = true;

    cursorTheme = {
      name = "catppuccin-macchiato-blue-cursors";
      package = pkgs.catppuccin-cursors.macchiatoBlue;
    };

    theme = {
      name = orchisName;
      package = orchisTheme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.theme = config.gtk.theme;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "adwaita-dark";
  };

  home.packages = with pkgs; [
    gtk-engine-murrine
    adwaita-icon-theme
    hicolor-icon-theme
    nautilus
    gnome-calculator
    gnome-disk-utility
    hyprpicker
    wl-clipboard
    hyprshot
    bluetui
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "NIXOS_OZONE_WL,1"
      ];

      exec-once = [
        "gnome-keyring-daemon --start --components=pkcs11,secrets,ssh"
        "systemctl --user start hyprpolkitagent"
        "noctalia-shell"
      ];

      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 1;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";
        resize_on_border = true;
      };

      input = {
        kb_layout = "se";
        follow_mouse = 1;
        accel_profile = "flat";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2.5;
        shadow.enabled = false;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.01;

          vibrancy = 0.2;
          vibrancy_darkness = 0.5;

          passes = 4;
          size = 7;

          popups = true;
          popups_ignorealpha = 0.2;
        };

      };

      animations.enabled = true;

      animation = [
        "border, 1, 2, default"
        "fade, 1, 4, default"
        "windows, 1, 3, default, popin 80%"
        "workspaces, 1, 2, default, slide"
      ];

      "$mod" = "SUPER";

      bind = [
        "$mod, Q, killactive,"
        "$mod, F, fullscreen,"
        "$mod, A, exec, hyprctl dispatch togglefloating && hyprctl dispatch resizeactive exact 900 600"

        "$mod, Return, exec, kitty"
        "$mod, W, exec, firefox"
        "$mod, D, exec, noctalia-shell ipc call launcher toggle"
        "$mod, P, exec, hyprpicker -a"
        "$mod, S, exec, hyprshot -m region --clipboard-only"
        "$mod, L, exec, noctalia-shell ipc call lockScreen lock"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = toString (i + 1);
          in
          [
            "$mod, ${ws}, workspace, ${ws}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
          ]
        ) 9
      ));

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
      ];

      misc = {
        disable_hyprland_logo = true;
        vrr = 1;
      };

    };
  };

  programs.noctalia-shell = {
    enable = true;
    colors = {
      mPrimary          = "#c6a0f6";
      mOnPrimary        = "#181926";
      mSecondary        = "#8aadf4";
      mOnSecondary      = "#181926";
      mTertiary         = "#f5bde6";
      mOnTertiary       = "#181926";
      mError            = "#ed8796";
      mOnError          = "#181926";
      mSurface          = "#24273a";
      mOnSurface        = "#cad3f5";
      mSurfaceVariant   = "#363a4f";
      mOnSurfaceVariant = "#b8c0e0";
      mOutline          = "#6e738d";
      mShadow           = "#000000";
    };
    settings = {
      settingsVersion = 59;
      bar = {
        position = "top";
        barType = "floating";
        marginVertical = 4;
        marginHorizontal = 4;
        outerCorners = false;
        backgroundOpacity = 0.8;
        frameRadius = 10;
        widgets = {
          left = [
            { id = "Launcher"; useDistroLogo = true; }
            { id = "SystemMonitor"; }
            { id = "ActiveWindow"; }
          ];
          center = [
            { id = "Workspace"; }
          ];
          right = [
            { id = "Tray"; drawerEnabled = false; }
            { id = "Volume"; }
            { id = "Clock"; }
            { id = "ControlCenter"; }
          ];
        };
      };
      general = {
        avatarImage = "/var/lib/AccountsService/icons/ebbe";
        telemetryEnabled = false;
        enableShadows = false;
      };
      ui = {
        fontDefault = "JetBrainsMono Nerd Font";
      };
      location = {
        name = "Lund, Sweden";
        autoLocate = false;
      };
      wallpaper = {
        enabled = true;
        directory = "~/nixos-config/assets/wallpapers";
        transitionType = [ "fade" ];
        transitionDuration = 1000;
      };
      colorSchemes = {
        useWallpaperColors = false;
      };
      appLauncher = {
        terminalCommand = "kitty -e";
      };
    };
  };
}
