{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./development.nix
    ./apps.nix
    ./hyprland.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ebbe";
  home.homeDirectory = "/home/ebbe";

  # This value determines the Home Manager release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}