{
  # Home-Manager user configuration - manages user-specific packages and dotfiles.
  # This is the equivalent of user configs in ~/.config but declarative and reproducible.
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
    ./nvim.nix
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
