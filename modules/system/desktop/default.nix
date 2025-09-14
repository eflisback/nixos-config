{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    # ./plasma.nix
    ./gnome.nix
  ];
}