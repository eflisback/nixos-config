{
  imports = [
    ../../home/common.nix
  ];

  addons.productivity.enable = true;
  addons.games.enable = true;
  addons.media.enable = true;
  addons.social.enable = true;
  addons.autoSuspend.enable = true;

  programs.noctalia.settings.wallpaper.default.path =
    "/home/ebbe/nixos-config/assets/wallpapers/field_of_fire.jpg";

  wayland.windowManager.hyprland.settings = {
    cursor.no_hardware_cursors = true;

    monitor = [
      "eDP-1,1920x1080@120,0x0,1"
      "HDMI-A-1,2560x1440@59.95,1920x0,1.25"
      ",preferred,auto,1"
    ];
  };

}
