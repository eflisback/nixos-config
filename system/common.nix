{ config, pkgs, ... }:

{
  # Common system configuration shared across all hosts.
  # Host-specific configs in hosts/ directory import this for base functionality.
  imports = [
    ./modules
  ];
}
