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
        userSettings = {
          "workbench.colorTheme" = "Tokyo Night";
          "editor.formatOnSave" = true;
          "editor.formatOnPaste" = true;

          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "nix.serverSettings".nixd.formatting.command = [ "nixfmt" ];

          "rust-analyzer.server.extraEnv".LD_LIBRARY_PATH = "${pkgs.zlib}/lib";

          "files.watcherExclude" = {
            "**/.bloop/**" = true;
            "**/.metals/**/*.{java,scala}" = true;
          };
        };
      };
    };
  };
}
