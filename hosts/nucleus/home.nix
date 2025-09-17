{ inputs, pkgs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  # Desktop-specific home configuration
  wayland.windowManager.hyprland.settings = {
    # Desktop dual monitor setup
    monitor = [
      # 144Hz ASUS monitor on left, 60Hz Samsung on right
      "DP-3,1920x1080@144,0x0,1.0"
      "HDMI-A-1,1920x1080@60,1920x0,1.0"
      # Disable laptop monitor when not connected
      "eDP-1,disable"
    ];

    # Workspace assignment for dual monitor
    workspace = [
      "1, monitor:DP-3, default:true"
    ];
  };
}