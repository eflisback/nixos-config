{ inputs, pkgs, ... }:

{
  imports = [
    ./user
    ../addons/home
  ];

  home.username = "ebbe";
  home.homeDirectory = "/home/ebbe";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
