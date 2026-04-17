{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../../system
  ];

  networking.hostName = "nucleus";
  networking.hosts = {
    "127.0.0.1" = [ "local.finch3d.com" ];
  };

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
