{
  config,
  pkgs,
  lib,
  ...
}:

{
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
  };
}
