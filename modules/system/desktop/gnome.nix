{ config, pkgs, ... }:

{
  # Display manager and desktop environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # GNOME-specific packages and configuration
  environment.gnome.excludePackages = (with pkgs; [
    # Remove unwanted GNOME apps if desired
    # gnome-photos
    # gnome-tour
  ]) ++ (with pkgs.gnome; [
    # cheese # webcam tool
    # gnome-music
    # epiphany # web browser
    # geary # email reader
    # gnome-characters
    # tali # poker game
    # iagno # go game
    # hitori # sudoku game
    # atomix # puzzle game
  ]);
}