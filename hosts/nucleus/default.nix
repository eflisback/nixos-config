{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/common.nix
  ];

  # Host-specific configuration
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