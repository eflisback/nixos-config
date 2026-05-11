{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
  ];

  networking.hostName = "nucleus";

  system.stateVersion = "25.05";
}
