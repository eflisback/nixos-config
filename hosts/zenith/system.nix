{ lib, ... }:

{
  imports = [
    ../../system
  ];

  addons.steam.enable = true;

  hardware.nvidia.open = lib.mkForce false;
}
