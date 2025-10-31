{ config, pkgs, ... }:

{

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    config = {
      common = {
        default = "*";
      };
      hyprland = {
        default = [ "hyprland" "gtk" ];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    hyprland = {
      enable = true;

      xwayland = {
        enable = true;
      };

      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    zsh.enable = true;
    mtr.enable = true;
  };

}
