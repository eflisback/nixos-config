{ inputs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  addons.productivity.enable = true;
  addons.games.enable = true;
  addons.media.enable = true;
  addons.social.enable = true;

  programs.noctalia.settings.wallpaper.default.path =
    "/home/ebbe/nixos-config/assets/wallpapers/field_of_fire.jpg";

}
