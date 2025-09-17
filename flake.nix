{
    description = "Ebbe's NixOS";

    inputs = {
	    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        firefox-addons = {
            url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
	let 
	    lib = nixpkgs.lib;
	    system = "x86_64-linux";
	    pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in
    {
		nixosConfigurations.nixos = lib.nixosSystem {
                inherit system;
				modules = [
                    ./system/configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.users.ebbe = import ./home;
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
}