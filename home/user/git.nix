{
  programs.git = {
    enable = true;

    settings = {
      # SETUP - ersätt namn och epostadress
      user.name = "Ebbe Flisbäck";
      user.email = "ebbe.flisback@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
