{ config, pkgs, ... }:

{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
          FastConnectable = true;

          # PS5 controller pairing settings
          Privacy = "device";
          JustWorksRepairing = "always";
          Class = "0x000100";
        };
      };
    };
    graphics.enable = true;
  };

  boot.extraModprobeConfig = ''
    options bluetooth disable_ertm=1
  '';
}
