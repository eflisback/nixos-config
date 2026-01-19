{
  description = "Ebbe's NixOS";

  # Flake inputs define external dependencies - similar to specifying repositories in Arch.
  # These are the "sources" that this configuration pulls packages and modules from.
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Outputs define what this flake provides - the actual system configurations.
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      # System configurations for each host machine.
      nixosConfigurations = {
        # Desktop workstation configuration.
        nucleus = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/nucleus
            home-manager.nixosModules.home-manager
            {
              home-manager.users.ebbe = import ./hosts/nucleus/home.nix;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                inherit pkgs-unstable inputs;
              };
            }
          ];
          specialArgs = {
            inherit pkgs-unstable;
          };
        };

        # Laptop configuration.
        orbit = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/orbit
            home-manager.nixosModules.home-manager
            {
              home-manager.users.ebbe = import ./hosts/orbit/home.nix;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                inherit pkgs-unstable inputs;
              };
            }
          ];
          specialArgs = {
            inherit pkgs-unstable;
          };
        };
      };

    };
}
