{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.addons.social.enable = lib.mkEnableOption "social and communication";

  config = lib.mkIf config.addons.social.enable {
    home.packages = with pkgs; [
      discord
      signal-desktop
      slack
];
  };
}
