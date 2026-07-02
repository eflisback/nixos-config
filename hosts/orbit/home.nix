{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ../../home/common.nix
  ];

  addons.productivity.enable = true;
  addons.games.enable = true;
  addons.media.enable = true;
  addons.social.enable = true;

  home.packages = [ pkgs.qsynth ];

  programs.noctalia.settings.bar.main.end = lib.mkForce [
    "tray"
    "battery"
    "volume"
    "clock"
    "control-center"
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1200@60,0x0,1"
      ",preferred,auto,1"
    ];
    workspace = [
      "1, monitor:eDP-1, default:true"
    ];
  };
}
