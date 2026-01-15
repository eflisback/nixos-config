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

    # Rust
    rustup

    # C
    gcc

    # IDE & GameDev
    vscodium
    claude-code
    godot-mono
    dotnet-sdk
    blender
    audacity

    # Bluetooth
    overskride

    # Browsers
    chromium

    # Social
    discord
    signal-desktop

    # Nix
    nixfmt

    # Studies
    anki-bin
    mpv
    ffmpeg

    # Piano
    pianobooster

    # Gaming
    pkgs.steam
    pkgs.steam-run
    (pkgs.lutris.override {
      extraPkgs = pkgs: [
        pkgs.wineWowPackages.stable
        pkgs.winetricks
      ];
    })
    heroic
    prismlauncher

    # Misc
    gimp
    gammastep
    vlc
    spotify
    texlive.combined.scheme-basic
    woeusb
    catppuccin-cursors.macchiatoBlue
    catppuccin-gtk
    papirus-folders
    pamixer
    brightnessctl
  ];
}
