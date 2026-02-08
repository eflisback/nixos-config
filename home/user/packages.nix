{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    scala
    scala-cli
    sbt
    jdk25
    python3
    uv
    android-studio
    arduino-ide
    nodejs
    nodePackages.pnpm
    claude-code
    godot-mono
    dotnet-sdk
    blender
    audacity
    discord
    signal-desktop
    anki-bin
    mpv
    ffmpeg
    steam
    steam-run
    prismlauncher
    gimp
    spotify
    vlc
    woeusb
  ];
}
