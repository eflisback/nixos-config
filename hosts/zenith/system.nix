{ lib, config, ... }:

{
  imports = [
    ../../system
  ];

  addons.steam.enable = true;
  addons.vpn.enable = true;
  addons.nvidia.enable = true;

  # GTX 1070 (Pascal) predates GSP firmware, which the open kernel
  # modules require (Turing/RTX 20xx and later only).
  hardware.nvidia.open = lib.mkForce false;

  # Pascal was dropped from the "stable" branch; needs the 580.xx legacy driver.
  hardware.nvidia.package = lib.mkForce config.boot.kernelPackages.nvidiaPackages.legacy_580;
}
