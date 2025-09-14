{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./hyprland.nix
    # ./gnome.nix
  ];
}