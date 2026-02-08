{
  imports = [
    ./kitty.nix
    ./config.nix
    ./environment.nix
    ./git.nix
    ./packages.nix
    ./programs.nix
    ./shell.nix
    ./wm
    ./xdg.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
