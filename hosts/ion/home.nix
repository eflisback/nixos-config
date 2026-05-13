{ inputs, lib, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  addons.productivity.enable = true;
  addons.social.enable = true;

  programs.noctalia-shell.settings.bar.widgets.right = lib.mkForce [
    {
      id = "Tray";
      drawerEnabled = false;
    }
    { id = "Battery"; }
    { id = "Volume"; }
    { id = "Clock"; }
    { id = "ControlCenter"; }
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "HDMI-A-1,1920x1080@60,0x0,1"
      "eDP-1,1920x1200@60,1920x0,1.5"
      ",preferred,auto,1"
    ];
    workspace = [
      "1, monitor:HDMI-A-1, default:true"
      "9, monitor:eDP-1, default:true"
    ];
  };
}
