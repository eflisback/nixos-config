{ config, pkgs, ... }:

{
  networking = {
	hostName = "orbit";
	networkmanager.enable = true;
  };
}
