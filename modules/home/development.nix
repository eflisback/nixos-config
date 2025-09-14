{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Scala and JVM
    scala_3
    openjdk17
    sbt

    # Development tools
    vscode
    git
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