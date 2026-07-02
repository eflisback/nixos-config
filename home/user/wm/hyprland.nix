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
    configType = "hyprlang";
    settings = {
      env = [
        "NIXOS_OZONE_WL,1"
      ];

      exec-once = [
        "gnome-keyring-daemon --start --components=pkcs11,secrets,ssh"
        "systemctl --user start hyprpolkitagent"
        "noctalia"
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
        "$mod, D, exec, noctalia msg panel-toggle launcher"
        "$mod, P, exec, hyprpicker -a"
        "$mod, S, exec, hyprshot -m region --clipboard-only"
        "$mod, L, exec, noctalia msg session lock"

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

  programs.noctalia = {
    enable = true;
    settings = {
      shell = {
        font_family = "JetBrainsMono Nerd Font";
        telemetry_enabled = false;
        avatar_path = "/var/lib/AccountsService/icons/ebbe";
      };
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };
      bar.main = {
        position = "top";
        margin_h = 4;
        margin_v = 4;
        background_opacity = 0.8;
        radius = 10;
        shadow = false;
        start = [ "launcher" "cpu" "active_window" ];
        center = [ "workspaces" ];
        end = [ "tray" "volume" "clock" "control-center" ];
      };
      wallpaper = {
        enabled = true;
        directory = "/home/ebbe/nixos-config/assets/wallpapers";
        transition = [ "fade" ];
        transition_duration = 1000;
      };
      location = {
        auto_locate = false;
        address = "Lund, Sweden";
      };
    };
  };
}
