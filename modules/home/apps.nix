{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    # Add more user applications here as needed
  ];
}