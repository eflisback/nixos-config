{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Lanzaboote configuration for Secure Boot support.
  # Replaces systemd-boot with a Secure Boot-compatible bootloader.

  environment.systemPackages = [
    # For debugging and troubleshooting Secure Boot.
    pkgs.sbctl
  ];

  # Lanzaboote currently replaces the systemd-boot module.
  # This setting is usually set to true in boot.nix, so we force it to false.
  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}