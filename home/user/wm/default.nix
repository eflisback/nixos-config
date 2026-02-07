{ pkgs, ... }:

{
  imports = [
    ./theme.nix
    ./gnome.nix
    ./hyprland.nix
  ];
}
