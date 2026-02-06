{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  networking.hostName = "orbit";

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  system.stateVersion = "25.05";
}
