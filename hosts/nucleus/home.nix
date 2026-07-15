{ inputs, pkgs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  addons.productivity.enable = true;
  addons.games.enable = true;
  addons.media.enable = true;
  addons.social.enable = true;

  programs.noctalia.settings.wallpaper.default.path =
    "/home/ebbe/nixos-config/assets/wallpapers/hail_mary.jpg";

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-3,1920x1080@144,0x0,1"
      "HDMI-A-1,1920x1080@60,1920x0,1"
      ",preferred,auto,1"
    ];
    workspace = [
      "1, monitor:DP-3, default:true"
    ];
  };
}
