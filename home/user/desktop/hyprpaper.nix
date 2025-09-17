{ config, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.config/wallpapers/wall.png"
      ];
      wallpaper = [
        "eDP-1,~/.config/wallpapers/wall.png"
        "DP-3,~/.config/wallpapers/wall.png"
        "HDMI-A-1,~/.config/wallpapers/wall.png"
      ];
      splash = false;
    };
  };
}
