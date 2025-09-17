{
  imports = [
    ./git.nix
    ./gtk.nix
    ./shell.nix
    ./config.nix
    ./packages.nix
    ./programs.nix
    ./environment.nix
    ./desktop
    ./xdg.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
