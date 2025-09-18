{ inputs, pkgs, ... }:
{
  # Desktop environment configuration modules.
  imports = [
    ./hyprland.nix
  ];
}
