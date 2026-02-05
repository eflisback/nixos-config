{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    # Scala & Java
    scala
    scala-cli
    sbt
    jdk25

    # Python (provided by ROS environment)
    # uv

    # Android
    android-studio

    # NodeJS
    nodejs
    nodePackages.pnpm

    # IDE & GameDev
    claude-code
    godot-mono
    dotnet-sdk
    blender
    audacity

    # Social
    discord
    signal-desktop

    # Nix
    nixfmt

    # Studies
    anki-bin
    mpv
    ffmpeg

    # Gaming
    steam
    steam-run
    # heroic
    prismlauncher

    # Misc
    gimp
    spotify
    vlc
    woeusb
  ];
}
