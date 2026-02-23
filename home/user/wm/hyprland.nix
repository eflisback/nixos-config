{
  config,
  lib,
  pkgs,
  wallpaper,
  ...
}:

{
  home.packages = with pkgs; [
    hyprpicker
    wl-clipboard
    hyprshot
    bluetui
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "systemctl --user start hyprpolkitagent"
        "ashell"
        "mako"
      ];

      general = {
        gaps_in = 3;
        gaps_out = 3;
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
        "$mod, D, exec, rofi -show drun"
        "$mod, P, exec, hyprpicker -a"
        "$mod, S, exec, hyprshot -m region --clipboard-only"
        "$mod, L, exec, hyprlock"

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
      app_launcher_cmd = "rofi -show drun";

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

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "kitty";
    font = "JetBrainsMono Nerd Font 10";
    extraConfig = {
      show-icons = true;
      drun-display-format = "{name}";
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#cad3f5";
        };
        window = {
          background-color = mkLiteral "#24273add";
          border = mkLiteral "2px";
          border-color = mkLiteral "#8aadf4";
          border-radius = mkLiteral "10px";
          width = mkLiteral "400px";
          padding = mkLiteral "10px";
        };
        mainbox = {
          spacing = mkLiteral "10px";
        };
        inputbar = {
          children = map mkLiteral [
            "prompt"
            "entry"
          ];
          spacing = mkLiteral "8px";
        };
        prompt = {
          text-color = mkLiteral "#b8c0e0";
        };
        entry = {
          placeholder = "Search...";
          placeholder-color = mkLiteral "#8087a2";
        };
        listview = {
          lines = 5;
          spacing = mkLiteral "5px";
        };
        element = {
          padding = mkLiteral "5px 10px";
          border-radius = mkLiteral "5px";
          spacing = mkLiteral "10px";
        };
        "element selected" = {
          background-color = mkLiteral "#5b6078";
        };
        "element-text" = {
          highlight = mkLiteral "bold";
          text-color = mkLiteral "inherit";
        };
        "element-icon" = {
          size = mkLiteral "24px";
        };
      };
  };

  services.mako = {
    enable = true;
    settings = {
      "" = {
        font = "JetBrainsMono Nerd Font 10";
        background-color = "#24273add";
        text-color = "#cad3f5ff";
        border-color = "#8aadf4ff";
        progress-color = "over #363a4fff";
        border-radius = 10;
        border-size = 2;
        padding = "10";
        default-timeout = 5000;
      };
      "urgency=high" = {
        border-color = "#f5a97fff";
      };
    };
  };

  systemd.user.services.mako.Install.WantedBy = lib.mkForce [ ];

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        fail_timeout = 500;
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = {
        monitor = "";
        path = "${wallpaper}";
        brightness = 0.7;
      };

      input-field = {
        monitor = "";
        size = "300, 50";
        outline_thickness = 2;
        outer_color = "rgb(8aadf4)";
        inner_color = "rgb(24273a)";
        font_color = "rgb(cad3f5)";
        fade_on_empty = true;
        placeholder_text = "";
        dots_size = 0.25;
        dots_spacing = 0.3;
        rounding = 10;
        check_color = "rgb(a6e3a1)";
        fail_color = "rgb(f38ba8)";
        capslock_color = "rgb(f5a97f)";
        position = "0, -50";
        halign = "center";
        valign = "center";
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
