{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];

  # Host-specific configuration
  networking.hostName = "orbit";
  
  # Laptop-specific settings
  # Enable power management
  powerManagement.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      START_CHARGE_THRESH_BAT0 = 20;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  # Laptop has Intel integrated graphics (no NVIDIA)
  # Already handled by shared hardware.nix (graphics.enable = true)
  
  system.stateVersion = "25.05";
}