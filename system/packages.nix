{ config, pkgs, ... }:

{
  # System-wide packages available to all users.
  # These are installed globally and accessible from any user session.
  environment.systemPackages = with pkgs; [
    # Core utilities
    bat
    btop
    eza
    fzf
    git
    gnumake
    just
    lm_sensors
    fastfetch
    neovim
    ripgrep
    tldr
    unzip
    openssl
    openssl.dev
    pkg-config
    wget
    zip
    zoxide
    sbctl
    tree
    cowsay
    sl

    # File manager and desktop portals
    thunar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
}
