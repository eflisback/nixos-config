{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  networking.hostName = "orbit";

  system.stateVersion = "25.05";
}
