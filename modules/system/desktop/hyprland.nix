{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${pkgs.sddm-chili-theme}/share/sddm/themes/chili";
  };

  environment.systemPackages = with pkgs; [
    qt5.qtgraphicaleffects
    qt5.qtquickcontrols2
    qt5.qtsvg
    sddm-chili-theme
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  security.polkit.enable = true;

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  # System-level services (user configuration handled in home-manager)
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
}