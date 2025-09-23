{ pkgs, pkgs-unstable, ... }:

{
  # User-specific packages installed in the home environment.
  # These are available only to this user, separate from system-wide packages.
  home.packages = with pkgs; [
    # Scala & Java
    scala
    scala-cli
    sbt
    openjdk

    # Python
    python3

    # NodeJS
    nodejs
    nodePackages.pnpm

    # IDE & GameDev
    vscodium
    claude-code
    godot-mono
    blender

    # Bluetooth
    bluetui

    # Social
    vesktop
    signal-desktop

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

    spotify
    texlive.combined.scheme-basic
    woeusb
    catppuccin-cursors.macchiatoBlue
    catppuccin-gtk
    papirus-folders
    pamixer # Volume control
    brightnessctl # Brightness control
  ];
}
