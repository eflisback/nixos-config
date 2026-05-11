{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
  ];

  networking.hostName = "zenith";

  system.stateVersion = "25.05";
}
