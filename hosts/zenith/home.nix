{ inputs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  wayland.windowManager.hyprland.settings = {
    cursor = {
      no_hardware_cursors = true;
    };
  };
}
