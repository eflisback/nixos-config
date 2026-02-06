{ pkgs, ... }:
let
  orchisTheme = pkgs.orchis-theme;

  wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/vinceliuice/Orchis-theme/master/wallpaper/4k.jpg";
    sha256 = "0w85g0rymcc97h9znhsxmvpnq7f0iw9c21k2sxqd6rwklkv9fmph";
  };

  orchisName = "Orchis-Purple-Dark";
in
{
  home.packages = with pkgs; [
    gtk-engine-murrine
    gnome-themes-extra
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.simpleweather
    gnomeExtensions.forge
  ];

  gtk = {
    enable = true;

    cursorTheme = {
      name = "Catppuccin-Macchiato-Blue";
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
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = orchisName;
      icon-theme = "Papirus-Dark";
      cursor-theme = "Catppuccin-Macchiato-Blue";
      toolbar-icons-size = "small";
    };

    "org/gnome/shell" = {
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "appindicatorsupport@rgcjonas.gmail.com"
        "simple-weather@romanlefler.com"
        "forge@jmmaranan.com"
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

    "org/gnome/shell/extensions/forge/keybindings" = {
      window-toggle-float = [ "<Super><Shift>a" ];
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "adwaita-dark";
    };
  };
}
