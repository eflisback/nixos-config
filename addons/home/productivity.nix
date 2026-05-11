{ config, lib, pkgs, ... }:

{
  options.addons.productivity.enable = lib.mkEnableOption "productivity and creative tools";

  config = lib.mkIf config.addons.productivity.enable {
    home.packages = with pkgs; [
      scala
      scala-cli
      sbt
      jdk25
      python3
      uv
      nodejs
      pnpm
      biome
      rustup
      gcc
      claude-code
      android-studio
      arduino-ide
      godot-mono
      dotnet-sdk
      blender
      gimp
      audacity
    ];
  };
}
