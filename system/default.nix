{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./gnome.nix
    ./hardware.nix
    ./internationalisation.nix
    ./networking.nix
    ./nix-settings.nix
    ./packages.nix
    ./polkit.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./time.nix
    ./users.nix
  ];
}
