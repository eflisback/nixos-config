{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../../system
  ];

  networking.hostName = "ion";
  networking.hosts = {
    "127.0.0.1" = [ "local.finch3d.com" ];
  };

  system.stateVersion = "25.05";
}
