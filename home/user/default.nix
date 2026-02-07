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

  # Allow proprietary packages - NixOS defaults to only free/open source software.
  # This setting enables packages with non-free licenses like Discord, Steam, etc.
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
