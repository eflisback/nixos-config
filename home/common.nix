{ inputs, pkgs, ... }:

{
  imports = [
    ./user
  ];

  home.username = "ebbe";
  home.homeDirectory = "/home/ebbe";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
