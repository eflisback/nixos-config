{ config, lib, pkgs, ... }:

{
  options.addons.printing.enable = lib.mkEnableOption "Printing";

  config = lib.mkIf config.addons.printing.enable {
    services.printing = {
      enable = true;
      drivers = [ pkgs.brlaser ];
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
