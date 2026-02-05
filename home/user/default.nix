{
  imports = [
    ./git.nix
    ./shell.nix
    ./config.nix
    ./packages.nix
    ./programs.nix
    ./environment.nix
    ./desktop
    ./xdg.nix
    ./ros.nix
  ];

  # Allow proprietary packages - NixOS defaults to only free/open source software.
  # This setting enables packages with non-free licenses like Discord, Steam, etc.
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
