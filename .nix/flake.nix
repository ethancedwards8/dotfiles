{
  description = "Ethan's NixOS and nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:ethancedwards8/nur/add_ethancedwards8-nur";
    # nur.url = "github:nix-community/nur";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, nixpkgs, /* nur, */ ...}@inputs:
    let
      darwin-configuration = ./darwin-configuration.nix;
      nixos-configuration = ./nixos-configuration.nix;

      nixpc-hardware = ./hardware/nixpc.nix;
      nixlaptop-hardware = ./hardware/nixlaptop.nix;
      
      cachix = ./cachix.nix;

      common = import ./modules/common.nix { inherit inputs; pkgs = nixpkgs; lib = nixpkgs.lib; };
    in
      {
        darwinConfigurations.mbair = darwin.lib.darwinSystem {
          modules = [ ({ pkgs, config, lib, ...}: {
          })
                      cachix
                      common
                      darwin-configuration
                      darwin.darwinModules.simple
          ];
        };
        nixosConfigurations.nixlaptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ({pkgs, config, lib, ... }: {
            networking.hostName = "nixlaptop"; # Define your hostname.
          })
                      cachix
                      common
                      nixos-configuration
                      nixlaptop-hardware
                      
          ];
        };
        nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ({ pkgs, config, lib, ...}: {
            networking.hostName = "nixpc"; # Define your hostname.
          })
                      cachix
                      common
                      nixos-configuration
                      nixpc-hardware
          ];
        };

        # expose the package set, including overlays, for convenience???
        darwinPackages = self.darwinConfigurations.mbair.pkgs;
      };
}
