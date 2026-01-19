{ inputs, pkgs, ... }:
{
  # KDE Plasma-specific packages
  home.packages = with pkgs; [
    alacritty
    libnotify
    wl-clipboard
  ];

  # Let KDE Plasma manage the desktop environment
  # Most configuration will be done through System Settings
}
