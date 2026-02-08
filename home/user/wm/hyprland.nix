{ pkgs, wallpaper, ... }:

{
  home.packages = with pkgs; [
    hyprlauncher
    hyprpicker
    wl-clipboard
    hyprshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "systemctl --user start hyprpolkitagent"
        "ashell"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 5;
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
        "$mod, A, togglefloating,"

        "$mod, Return, exec, kitty"
        "$mod, W, exec, firefox"
        "$mod, D, exec, hyprlauncher"
        "$mod, P, exec, hyprpicker -a"
        "$mod, S, exec, hyprshot -m region"

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

      bindm = [
        "$mod, mouse:272, movewindow"
      ];

      misc = {
        disable_hyprland_logo = true;
        vrr = 1;
      };
    };
  };

  programs.ashell = {
    enable = true;
    settings = {
      log_level = "warn";
      position = "Top";
      app_launcher_cmd = "hyprlauncher";

      modules = {
        left = [
          [
            "Workspaces"
          ]
        ];
        center = [ "WindowTitle" ];
        right = [
          "Tray"
          "Clock"
          "Settings"
        ];
      };

      workspaces = {
        enable_workspace_filling = false;
        visibility_mode = "MonitorSpecific";
      };

      window_title = {
        truncate_title_after_length = 100;
      };

      appearance = {
        style = "Island";
        font_family = "JetBrainsMono Nerd Font";
        scale_factor = 1.15;

        success_color = "#a6e3a1";
        text_color = "#cdd6f4";
        workspace_colors = [
          "#fab387"
          "#b4befe"
          "#cba6f7"
        ];

        primary_color = {
          base = "#fab387";
          text = "#1e1e2e";
        };

        danger_color = {
          base = "#f38ba8";
          weak = "#f9e2af";
        };

        background_color = {
          base = "#1e1e2e";
          weak = "#313244";
          strong = "#45475a";
        };

        secondary_color = {
          base = "#11111b";
          strong = "#1b1b25";
        };
      };
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [ "${wallpaper}" ];
      wallpaper = [
        {
          monitor = "";
          path = "${wallpaper}";
          fit_mode = "cover";
        }
      ];
    };
  };
}
