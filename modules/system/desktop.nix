{ config, pkgs, ... }:

{
  # X11 and desktop environment
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

  # Console keymap
  console.keyMap = "sv-latin1";

  # Sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing
  services.printing.enable = true;

  # Firefox
  programs.firefox.enable = true;
}