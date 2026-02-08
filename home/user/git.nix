{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Ebbe Flisbäck";
      user.email = "ebbe.flisback@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
