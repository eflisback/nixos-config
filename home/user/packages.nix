{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    # Scala & Java
    scala
    sbt
    openjdk

    # NodeJS
    nodejs
    nodePackages.pnpm

    # Misc
    vscodium
    claude-code
    godot-mono

    # Bluetooth
    bluetui

    # Social
    vesktop

    # Nix
    nixfmt-rfc-style

    # Gaming
    pkgs.steam
    pkgs.steam-run
    (pkgs.lutris.override {
      extraPkgs = pkgs: [
        pkgs.wineWowPackages.stable
        pkgs.winetricks
      ];
    })

    hyprshot
    catppuccin-cursors.macchiatoBlue
    catppuccin-gtk
    papirus-folders
    pamixer # Volume control
    brightnessctl # Brightness control
  ];
}
