{ config, pkgs, ... }:

{
  # Console keymap (shared between X11 and Wayland)
  console.keyMap = "sv-latin1";

  # Sound with pipewire (works with both X11 and Wayland)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing (desktop environment agnostic)
  services.printing.enable = true;

  # Firefox (available in both desktop environments)
  programs.firefox.enable = true;

  # Fonts (needed by all desktop environments)
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}