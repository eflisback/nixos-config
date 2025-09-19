{
  programs.git = {
    enable = true;
    userName = "Ebbe Flisbäck";
    userEmail = "ebbe.flisback@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
