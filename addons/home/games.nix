{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.addons.games.enable = lib.mkEnableOption "games";

  config = lib.mkIf config.addons.games.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}
