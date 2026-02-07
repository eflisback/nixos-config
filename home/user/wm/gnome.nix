{
  pkgs,
  lib,
  wallpaper,
  ...
}:

let
  orchisName = "Orchis-Purple-Dark";
in
{
  home.packages = with pkgs; [
    nautilus
    gnome-usage
    gnome-notes
    gnome-calculator
    gnome-disk-utility
    gnome-themes-extra
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.simpleweather
  ];

  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      toggle-maximized = [ "<Super>f" ];
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "<Super><Shift>s" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Kitty";
      command = "kitty";
      binding = "<Super>Return";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Firefox";
      command = "firefox";
      binding = "<Super>w";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = orchisName;
      icon-theme = "Papirus-Dark";
      cursor-theme = "catppuccin-macchiato-blue-cursors";
      toolbar-icons-size = "small";
    };

    "org/gnome/shell" = {
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "appindicatorsupport@rgcjonas.gmail.com"
        "simple-weather@romanlefler.com"
      ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = orchisName;
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file://${wallpaper}";
      picture-uri-dark = "file://${wallpaper}";
      picture-options = "zoom";
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = "file://${wallpaper}";
      picture-options = "zoom";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      blur = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
    };
  };
}
