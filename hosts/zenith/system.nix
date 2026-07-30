{ lib, ... }:

{
  imports = [
    ../../system
  ];

  addons.steam.enable = true;
  addons.vpn.enable = true;

  hardware.nvidia.open = lib.mkForce false;
}
