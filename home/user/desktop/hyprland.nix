{ inputs, pkgs, ... }:
{
  # Hyprland-specific packages
  home.packages = with pkgs; [
    hyprpaper
    kitty
    libnotify
    mako
    qt5.qtwayland
    qt6.qtwayland
    swayidle
    swaylock-effects
    wlogout
    wl-clipboard
    wofi
    waybar
    hyprshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor configuration moved to host-specific configs
      # Default fallback monitor config
      monitor = [
        ",preferred,auto,1.0"
      ];

      # Startup applications
      exec-once = [
        "dbus-update-activation-environment --systemd --all"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        "waybar"
        "swayidle -w"
        "nwg-look -a"
      ];

      # Variables
      "$mainMod" = "SUPER";

      # Cursor configuration
      cursor = {
        no_hardware_cursors = true;
        enable_hyprcursor = true;
      };

      # Key bindings
      bind = [
        # Basic window management
        "$mainMod, Return, exec, kitty"
        "$mainMod, Q, killactive"
        "$mainMod, M, exec, wlogout --protocol layer-shell"
        "$mainMod, E, exec, thunar"
        "$mainMod, A, togglefloating"
        "$mainMod, D, exec, wofi --show drun"
        "$mainMod, P, pseudo"
        "$mainMod, S, togglesplit"
        "$mainMod, L, exec, swaylock"

        # Screenshot bindings
        "$mainMod SHIFT, S, exec, hyprshot -m output --clipboard-only"

        # Clip it!
        "SHIFT, F8, pass, class:^(com\.obsproject\.Studio)$"

        # Focus with Super+arrow keys (like i3)
        "$mainMod, Left, movefocus, l"
        "$mainMod, Right, movefocus, r"
        "$mainMod, Up, movefocus, u"
        "$mainMod, Down, movefocus, d"

        # Focus with Alt+hjkl (alternative)
        "ALT, h, movefocus, l"
        "ALT, l, movefocus, r"
        "ALT, k, movefocus, u"
        "ALT, j, movefocus, d"

        # Move windows between monitors with Super+Shift+left/right
        "$mainMod SHIFT, Left, movewindow, mon:l"
        "$mainMod SHIFT, Right, movewindow, mon:r"

        # Workspace switching
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

        # Move to workspace
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

        # Resize windows
        "$mainMod CTRL, l, resizeactive, 10 0"
        "$mainMod CTRL, h, resizeactive, -10 0"
        "$mainMod CTRL, k, resizeactive, 0 -10"
        "$mainMod CTRL, j, resizeactive, 0 10"

        # Application shortcuts
        "$mainMod, W, exec, firefox"
        "$mainMod, c, exec, telegram-desktop"

        # Window resizing (using direct resize instead of submap)
        "$mainMod SHIFT, h, resizeactive, -30 0"
        "$mainMod SHIFT, l, resizeactive, 30 0"
        "$mainMod SHIFT, k, resizeactive, 0 -30"
        "$mainMod SHIFT, j, resizeactive, 0 30"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Input configuration
      input = {
        kb_layout = "se";
        follow_mouse = 1;
        sensitivity = 0;
      };

      # General appearance
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgb(8aadf4) rgb(24273A) rgb(24273A) rgb(8aadf4) 45deg";
        "col.inactive_border" = "rgb(24273A) rgb(24273A) rgb(24273A) rgb(24273A) 45deg";
        layout = "dwindle";
        allow_tearing = false;
        resize_on_border = true;
        extend_border_grab_area = 15;
      };

      # Decoration settings
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

      # Animation settings
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

      # Layout settings
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      # Misc settings
      misc = {
        force_default_wallpaper = 0;
      };

      # Window rules
      windowrule = [
        "float, title:Open File"
        "float, title:branchdialog"
        "float, title:wlogout"
        "fullscreen, title:wlogout"
      ];

      windowrulev2 = [
        # Floating windows
        "float, class:(file_progress)"
        "float, class:(confirm)"
        "float, class:(dialog)"
        "float, class:(download)"
        "float, class:(notification)"
        "float, class:(error)"
        "float, class:(splash)"
        "float, class:(confirmreset)"
        "float, class:(viewnior)"
        "float, class:(pavucontrol-qt)"
        "float, class:(org.pulseaudio.pavucontrol)"
        "float, class:(file-roller)"
        "fullscreen, class:(wlogout)"
        "idleinhibit focus, class:(mpv)"
        "float, title:^(Media viewer)$"

        # Picture in picture windows
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
