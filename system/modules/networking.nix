{ config, pkgs, ... }:

{
  networking = {
    hostName = "nucleus";
    networkmanager.enable = true;
  };
}
