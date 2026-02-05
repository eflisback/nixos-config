{ inputs, pkgs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  programs.zsh.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-gnome/#orbit";
  };
}
