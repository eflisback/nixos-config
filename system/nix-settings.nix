{ config, pkgs, ... }:

{
  documentation.nixos.enable = false;

  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  nix = {
    settings = {
      warn-dirty = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      http-connections = 0;
      download-buffer-size = 134217728;
      substituters = [
        "https://nix-gaming.cachix.org"
        "https://ros.cachix.org"
      ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
