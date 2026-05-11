{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.addons.media.enable = lib.mkEnableOption "media players";

  config = lib.mkIf config.addons.media.enable {
    home.packages = with pkgs; [
      mpv
      ffmpeg
      vlc
      stremio-linux-shell
    ];
  };
}
