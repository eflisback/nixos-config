{ config, pkgs, ... }:

{
  # Host-specific configuration for the desktop workstation.
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  networking.hostName = "nucleus";
  
  # Desktop-specific hardware configuration
  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  
  system.stateVersion = "25.05";
}