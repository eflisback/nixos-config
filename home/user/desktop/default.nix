{ pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./gtk.nix
    ./alacritty.nix
  ];
}
