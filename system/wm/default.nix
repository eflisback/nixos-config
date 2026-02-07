{ config, pkgs, ... }:

{
  imports = [
    ./gnome.nix
    ./hyprland.nix
  ];
}
