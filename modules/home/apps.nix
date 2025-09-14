{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    alacritty
    # Add more user applications here as needed
  ];
}