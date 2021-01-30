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
      
      cachix = import ./cachix.nix;
    in
      {
        darwinConfigurations.mbair = darwin.lib.darwinSystem {
          modules = [ cachix darwin-configuration darwin.darwinModules.simple {nixpkgs.overlays = [ nur.overlay ]; } ];
          inputs = inputs;
        };
        nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ cachix nixos-configuration {nixpkgs.overlays = [ nur.overlay ]; } ];
        };

        # expose the package set, including overlays, for convenience???
        darwinPackages = self.darwinConfigurations.mbair.pkgs;
      };
}
