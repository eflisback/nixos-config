{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

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
      rtk
      android-studio
      arduino-ide
      godot-mono
      dotnet-sdk
      blender
      gimp
      audacity
      just
      nixd
      nixfmt
      verifpal
    ];

    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    programs.vscodium = {
      enable = true;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          eamodio.gitlens
          rust-lang.rust-analyzer
          ms-python.python
          enkia.tokyo-night
          oxc.oxc-vscode
          scala-lang.scala
          scalameta.metals
        ];
      };
    };
  };
}
