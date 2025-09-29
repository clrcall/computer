{
    description = "Sen's NixOS";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        automapaper = {
            url = "github:itepastra/automapaper";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        nixosConfigurations.Lordran = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            specialArgs = {
              inherit inputs;
            };

            modules = [
                ./hosts/Lordran
                ./modules/gaming
                ./modules/dev
                ./modules/desktop

            { home-manager.extraSpecialArgs.inputs = inputs; }

            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.sen = import ./home/sen/home.nix;
            }
            ];
        };

        nixosConfigurations.Drangleic = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            specialArgs = {
              inherit inputs;
            };

            modules = [
                ./hosts/Drangleic
                ./modules/gaming
                ./modules/dev
                ./modules/desktop

            { home-manager.extraSpecialArgs.inputs = inputs; }

            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.sen = import ./home/sen/home.nix;
            }
            ];
        };

        formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

    };
}
