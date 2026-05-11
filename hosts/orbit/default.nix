{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
  ];

  networking.hostName = "orbit";

  system.stateVersion = "25.05";
}
