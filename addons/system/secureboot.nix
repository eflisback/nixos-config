{ config, lib, pkgs, ... }:

{
  options.addons.secureboot.enable = lib.mkEnableOption "lanzaboote secure boot";

  config = lib.mkIf config.addons.secureboot.enable {
    boot.loader.systemd-boot.enable = lib.mkForce false;

    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    environment.systemPackages = [ pkgs.sbctl ];
  };
}
