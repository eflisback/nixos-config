{ config, pkgs, ... }:

{
  # X11 base configuration
  services.xserver = {
    enable = true;
    xkb = {
      layout = "se";
      variant = "";
    };
  };

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