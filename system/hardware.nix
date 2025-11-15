{ config, pkgs, ... }:

{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;  # Show battery level
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

  # Critical for PlayStation controllers
  boot.extraModprobeConfig = ''
    options bluetooth disable_ertm=1
  '';

  # Bluetooth management GUI
  services.blueman.enable = true;
}
