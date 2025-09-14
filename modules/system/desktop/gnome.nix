{ config, pkgs, ... }:

{
  # X11 configuration (required for GNOME)
  services.xserver = {
    enable = true;
    xkb = {
      layout = "se";
      variant = "";
    };
  };

  # Display manager and desktop environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Install Pop Shell and other GNOME extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.pop-shell
    adwaita-icon-theme
    gnome-themes-extra
    gtk3
    gtk4
    vanilla-dmz
    dconf-editor
    gnome-tweaks
  ];

  # GNOME-specific packages and configuration
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    cheese
    gnome-music
    epiphany
    geary
    gnome-characters
    tali
    iagno
    hitori
    atomix
  ]);
}