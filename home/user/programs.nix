{ inputs, pkgs, ... }:
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

        settings = {
          # Enable dark mode preferences
          "ui.systemUsesDarkTheme" = 1;
          "layout.css.prefers-color-scheme.content-override" = 0;
          
          # Use system theme for Firefox interface
          "extensions.activeThemeID" = "default-theme@mozilla.org";
          "browser.theme.dark-private-windows" = true;
          
          # Dark scrollbars
          "widget.content.gtk-theme-override" = "Adwaita:dark";
        };
    };
  };

  programs.home-manager.enable = true;

  programs.obs-studio = {
    enable = true;

    # optional Nvidia hardware acceleration
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi #optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "eDP-1,1920x1200@59.95,0x0,1.0"
      ];

      exec-once = [
        "dbus-update-activation-environment --systemd --all"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        "waybar & hyprpaper"
        "swayidle -w"
        "nwg-look -a"
        # Removed auto-starting applications - launch manually when needed
        # "[workspace 2 silent] firefox"
        # "[workspace 10 silent] telegram-desktop"
        # "[workspace 10 silent] vesktop"
        # "[workspace 3 silent] thunderbird"
        # "[workspace 5 silent] steam"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod, Q, killactive"
        "$mainMod, M, exec, wlogout --protocol layer-shell"
        "$mainMod, E, exec, thunar"
        "$mainMod, A, togglefloating"
        "$mainMod, D, exec, wofi --show drun"
        "$mainMod, P, pseudo"
        "$mainMod, S, togglesplit"
        "$mainMod SHIFT, L, exec, swaylock"
        ", PRINT, exec, hyprshot -m region --clipboard-only"

        # Focus with Alt+direction
        "ALT, h, movefocus, l"
        "ALT, l, movefocus, r"
        "ALT, k, movefocus, u"
        "ALT, j, movefocus, d"

        # Move windows with Super+direction
        "$mainMod, h, movewindow, l"
        "$mainMod, l, movewindow, r"
        "$mainMod, k, movewindow, u"
        "$mainMod, j, movewindow, d"

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

        # Resize with Super+Ctrl+direction
        # Note: Super+direction now moves windows

        "$mainMod, W, exec, firefox"
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
        # Removed workspace assignments - let applications open where needed
      ];
    };
  };
}
