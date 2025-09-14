{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    scala
    openjdk
    sbt
    claude-code
    vscode
    git
    nixfmt-rfc-style
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