{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Boot configuration using systemd-boot (modern UEFI bootloader).
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
  };
}
