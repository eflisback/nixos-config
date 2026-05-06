{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  networking.hostName = "zenith";

  system.stateVersion = "25.05";
}
