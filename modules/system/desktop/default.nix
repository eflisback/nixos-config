{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./gnome.nix
    # ./hyprland.nix  # Uncomment when ready to switch
  ];
}