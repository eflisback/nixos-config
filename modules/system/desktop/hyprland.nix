{ config, pkgs, ... }:

{
  # Hyprland configuration - currently disabled
  # Uncomment and configure when ready to migrate from GNOME
  
  # programs.hyprland.enable = true;
  
  # # Display manager for Hyprland
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  
  # # Additional packages for Hyprland
  # environment.systemPackages = with pkgs; [
  #   # Terminal
  #   kitty
  #   
  #   # Application launcher
  #   wofi
  #   
  #   # Notifications
  #   dunst
  #   
  #   # Status bar
  #   waybar
  #   
  #   # Screenshots
  #   grim
  #   slurp
  #   
  #   # Clipboard
  #   wl-clipboard
  #   
  #   # Wallpaper
  #   hyprpaper
  #   
  #   # File manager
  #   nautilus
  # ];
}