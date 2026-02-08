{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop
    eza
    fzf
    git
    gnumake
    lm_sensors
    fastfetch
    nixfmt
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
  ];
}
