{ config, pkgs, ... }:

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
    vscode
    git
    nixfmt-rfc-style
    claude-code
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Ebbe Flisbäck";
    userEmail = "ebbe.flisback@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };
}