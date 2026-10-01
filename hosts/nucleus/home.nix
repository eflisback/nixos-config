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
    "/home/ebbe/nixos-config/assets/wallpapers/hail_mary.jpg";

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-2,2560x1440@200,0x0,1"
      "DP-3,2560x1440@200,2560x0,1"
      ",preferred,auto,1"
    ];
    workspace = [
      "1, monitor:DP-2, default:true"
    ];
  };
}
