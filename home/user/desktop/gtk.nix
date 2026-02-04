{ pkgs, ... }:
let
  orchisTheme = pkgs.orchis-theme.override {
    tweaks = [ "solid" ];
  };

  wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/vinceliuice/Orchis-theme/master/wallpaper/4k.jpg";
    sha256 = "0w85g0rymcc97h9znhsxmvpnq7f0iw9c21k2sxqd6rwklkv9fmph";
  };
in
{
  home.packages = with pkgs; [
    gtk-engine-murrine
    gnome-themes-extra
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
  ];

  gtk = {
    enable = true;

    cursorTheme = {
      name = "Catppuccin-Macchiato-Blue";
      package = pkgs.catppuccin-cursors.macchiatoBlue;
    };

    theme = {
      name = "Orchis-Green-Dark-Compact";
      package = orchisTheme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-folders;
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
      gtk-theme = "Orchis-Green-Dark-Compact";
      icon-theme = "Papirus-Dark";
      cursor-theme = "Catppuccin-Macchiato-Blue";
      toolbar-icons-size = "small";
    };

    "org/gnome/shell" = {
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
      ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Orchis-Green-Dark-Compact";
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

    "org/gnome/mutter" = {
      workspaces-only-on-primary = false;
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
