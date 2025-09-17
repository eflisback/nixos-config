{ ... }:

{
  # System-wide module imports - each file configures a specific aspect of the system.
  # This modular approach keeps configuration organized and maintainable.
  imports = [
    ./boot.nix
    ./fonts.nix
    ./gaming.nix
    ./hardware.nix
    ./hyprland.nix
    ./internationalisation.nix
    ./networking.nix
    ./nixsettings.nix
    ./packages.nix
    ./polkit.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./time.nix
    ./theme.nix
    ./users.nix
    ./virtualisation.nix
  ];
}
