{ inputs, pkgs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  home.packages = [ pkgs.qsynth ];

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
