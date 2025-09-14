{ config, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "pop-shell@system76.com"
        ];
      };

      "org/gnome/shell/extensions/pop-shell" = {
        tile-by-default = true;
        gap-inner = 2;
        gap-outer = 2;
        smart-gaps = false;
      };

      "org/gnome/desktop/wm/preferences" = {
        focus-mode = "sloppy";
        resize-with-right-button = true;
      };

      "org/gnome/desktop/interface" = {
        enable-hot-corners = true;
        clock-show-weekday = false;
      };
    };
  };
}