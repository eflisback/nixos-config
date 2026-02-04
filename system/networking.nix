{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  # Open ports for development servers
  networking.firewall.allowedTCPPorts = [
    3000
    5173
    8080
  ];
  networking.firewall.allowedUDPPorts = [ 8080 ];
}
