{ config, pkgs, ... }:

{
  users.users.ebbe = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "qemu"
      "kvm"
      "libvirtd"
      "networkmanager"
    ];
  };
}
