{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

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
      nixosConfigurations = {
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
        };
      };
    };
}
