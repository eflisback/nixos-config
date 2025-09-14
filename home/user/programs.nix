{ inputs, ... }:
{
  programs.firefox = {
    enable = true;

    profiles.ebbe = {
        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
            darkreader
            facebook-container
            i-dont-care-about-cookies
            proton-pass
            to-google-translate
            view-image
            ublock-origin
            youtube-shorts-block
        ];
    };
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "HDMI-A-1,2560x1440@164.835999,0x0,1"
      ];

      exec-once = [
        "dbus-update-activation-environment --systemd --all"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        "waybar & hyprpaper"
        "swayidle -w"
        "nwg-look -a"
        "[workspace 2 silent] firefox"
        "[workspace 10 silent] telegram-desktop"
        "[workspace 10 silent] vesktop"
        "[workspace 3 silent] thunderbird"
        "[workspace 5 silent] steam"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod, Q, killactive"
        "$mainMod, M, exec, wlogout --protocol layer-shell"
        "$mainMod, E, exec, thunar"
        "$mainMod, V, togglefloating"
        "$mainMod, D, exec, wofi --show drun"
        "$mainMod, P, pseudo"
        "$mainMod, S, togglesplit"
        "$mainMod SHIFT, Q, exec, swaylock"
        ", PRINT, exec, hyprshot -m region --clipboard-only"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod CTRL, l, resizeactive, 10 0"
        "$mainMod CTRL, h, resizeactive, -10 0"
        "$mainMod CTRL, k, resizeactive, 0 -10"
        "$mainMod CTRL, j, resizeactive, 0 10"

        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        "$mainMod, b, exec, firefox"
        "$mainMod, c, exec, telegram-desktop"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      input = {
        kb_layout = "se";
        kb_options = "caps:none";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgb(8aadf4) rgb(24273A) rgb(24273A) rgb(8aadf4) 45deg";
        "col.inactive_border" = "rgb(24273A) rgb(24273A) rgb(24273A) rgb(24273A) 45deg";
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 2;
          passes = 2;
          xray = false;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
        ];
        animation = [
          "windows, 1, 5, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "windowsMove, 1, 4, default"
          "border, 1, 10, default"
          "fade, 1, 10, smoothIn"
          "fadeDim, 1, 10, smoothIn"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      gestures = {
        workspace_swipe = false;
      };

      misc = {
        force_default_wallpaper = 0;
      };

      windowrule = [
        "float, file_progress"
        "float, confirm"
        "float, dialog"
        "float, download"
        "float, notification"
        "float, error"
        "float, splash"
        "float, confirmreset"
        "float, title:Open File"
        "float, title:branchdialog"
        "float,viewnior"
        "float, pavucontrol-qt"
        "float, pavucontrol"
        "float, file-roller"
        "fullscreen, wlogout"
        "float, title:wlogout"
        "fullscreen, title:wlogout"
        "idleinhibit stayfocused, mpv"
      ];

      windowrulev2 = [
        "float, title:^(Media viewer)$"
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "float, class:^(vesktop)$,title:^(Discord Popout)$"
        "pin, class:^(vesktop)$,title:^(Discord Popout)$"
        "float, class:^(steam)$,title:^(Friends List)$"
        "workspace 1, class:^(kitty)$"
        "workspace 2, class:^(firefox)$"
        "workspace 5, class:^(steam)$"
        "workspace 10, class:^(org.telegram.desktop)$"
        "workspace 10, class:^(vesktop)$"
      ];
    };
  };
}
