{ inputs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  addons.productivity.enable = true;
  addons.games.enable = true;
  addons.media.enable = true;
  addons.social.enable = true;

  wayland.windowManager.hyprland.settings = {
    cursor = {
      no_hardware_cursors = true;
    };
  };
}
