{ config, pkgs, ... }:

{
  # Common system configuration shared across all hosts.
  # Host-specific configs in hosts/ directory import this for base functionality.
  imports = [
    ./boot.nix
    ./fonts.nix
    ./gaming.nix
    ./hardware.nix
    ./internationalisation.nix
    ./lanzaboote.nix
    ./networking.nix
    ./nixsettings.nix
    ./packages.nix
    ./polkit.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./theme.nix
    ./time.nix
    ./users.nix
    ./virtualisation.nix
  ];
}
