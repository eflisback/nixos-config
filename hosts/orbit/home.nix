{ inputs, pkgs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  # Laptop-specific home configuration
  programs.zsh.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config/#orbit";
  };

  # KDE Plasma will handle monitor and input configuration through System Settings
  # Laptop configuration: single monitor (eDP-1), touchpad with natural scroll
  # Media keys (brightness, volume) are handled by KDE automatically
}
