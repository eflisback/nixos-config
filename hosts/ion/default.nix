{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
  ];

  networking.hostName = "ion";

  system.stateVersion = "25.05";
}
