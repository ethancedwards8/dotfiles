{
  description = "Ethan's NixOS and nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-20.09";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    nur = {
      url = "github:nix-community/nur/master";
      inputs.nur.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, nixpkgs, nur, ...}@inputs:
    let
      darwin-configuration = ./darwin-configuration.nix;
      nixos-configuration = ./nixos-configuration.nix;

      nixpc-hardware = ./hardware/nixpc.nix;
      nixlaptop-hardware = ./hardware/nixlaptop.nix;
      
      cachix = ./cachix.nix;

      common = import ./modules/common.nix { inherit inputs; };
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
            networking.hostName = "nixlaptop";
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
            networking.hostName = "nixpc";
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
