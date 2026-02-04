{ config, pkgs, ... }:

{
  # SETUP - ersätt 'ebbe' med 'olle'
  users.users.ebbe = {
    isNormalUser = true;
    description = "Ebbe Flisbäck";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "docker"
      "qemu"
      "kvm"
      "libvirtd"
      "networkmanager"
    ];
  };
}
