{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  services.displayManager.defaultSession = "hyprland-uwsm";

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    hyprpolkitagent
  ];
}
