{
  description = "Ethan's NixOS and nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    darwin = {
      url = "github:ethancedwards8/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, darwin, nixpkgs, nur, ...}@inputs:
    let
      darwin-configuration = ./darwin-configuration.nix;

      nixos-configuration = ./nixos-configuration.nix;

      nixpc-hardware = ./hardware/nixpc.nix;
      nixlaptop-hardware = ./hardware/nixlaptop.nix;
      
      cachix = import ./cachix.nix;
    in
      {
        darwinConfigurations.mbair = darwin.lib.darwinSystem {
          modules = [ cachix darwin-configuration darwin.darwinModules.simple {nixpkgs.overlays = [ nur.overlay ]; } ];
          inputs = inputs;
        };
        nixosConfigurations.nixlaptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ cachix nixos-configuration nixlaptop-hardware {nixpkgs.overlays = [ nur.overlay ]; } {nix.registry.nixpkgs.flake = nixpkgs; nix.registry.nur.flake = nur;} ];
        };
        nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ cachix nixos-configuration nixpc-hardware {nixpkgs.overlays = [ nur.overlay ]; } {nix.registry.nixpkgs.flake = nixpkgs; nix.registry.nur.flake = nur;} ];
        };


        # expose the package set, including overlays, for convenience???
        darwinPackages = self.darwinConfigurations.mbair.pkgs;
      };
}
