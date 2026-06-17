{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.addons.work.enable = lib.mkEnableOption "work environment (finch3d)";

  config = lib.mkIf config.addons.work.enable {
    networking.hosts."127.0.0.1" = [ "local.finch3d.com" ];

    environment.systemPackages = with pkgs; [
      mkcert
      nss
    ];

    home-manager.users.ebbe.home.packages = with pkgs; [
      turbo
      gh
      awscli2
      chromium
    ];
  };
}
