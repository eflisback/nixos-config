{ config, pkgs, ... }:

{
  # User account configuration.
  users.users.ebbe = {
    isNormalUser = true;
    shell = pkgs.zsh;
    # Groups provide permissions for system resources and services.
    extraGroups = [
      "wheel" # sudo access
      "audio" # audio and MIDI device access
      "qemu"
      "kvm"
      "libvirtd" # virtualization
      "networkmanager" # network configuration
    ];
  };
}
