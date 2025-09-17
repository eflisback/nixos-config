{ inputs, pkgs, ... }:

{
  imports = [
    ./user
  ];

  # Shared home-manager configuration
  # Host-specific overrides go in hosts/*/home.nix
}