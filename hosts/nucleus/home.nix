{ inputs, pkgs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

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
