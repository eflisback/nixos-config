{ pkgs, ... }:

let
  orchisTheme = pkgs.orchis-theme;
  orchisName = "Orchis-Purple-Dark";
  wallpaper = ../../../assets/wallpaper.png;
in
{
  _module.args.wallpaper = wallpaper;

  home.pointerCursor = {
    name = "catppuccin-macchiato-blue-cursors";
    package = pkgs.catppuccin-cursors.macchiatoBlue;
    size = 24;
    gtk.enable = true;
  };

  home.packages = with pkgs; [
    gtk-engine-murrine
    adwaita-icon-theme
    hicolor-icon-theme
  ];

  gtk = {
    enable = true;

    cursorTheme = {
      name = "catppuccin-macchiato-blue-cursors";
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

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "adwaita-dark";
  };
}
