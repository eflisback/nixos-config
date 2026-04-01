{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  networking.hostName = "ion";

  system.stateVersion = "25.05";
}
