{ pkgs, wallpaper, ... }:

{
  home.packages = with pkgs; [
    hyprlauncher
    hyprpicker
    wl-clipboard
    hyprshot
  ];

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

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "systemctl --user start hyprpolkitagent"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 8;
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
      ];

      misc = {
        disable_hyprland_logo = true;
        vrr = 1;
      };
    };
  };
}
