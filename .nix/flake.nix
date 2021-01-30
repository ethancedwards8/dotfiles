{
  description = "Ethan's NixOS and nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    inputs.nixos-hardware.url = "github:nixos/nixos-hardware";

    darwin.url = "github:ethancedwards8/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    darwin = {
      url = "github:ethancedwards8/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, darwin, nixpkgs, nur, ...}@inputs:
    let
      darwin-configuration = ./darwin/darwin-configuration.nix;
      
      cachix = import ./cachix.nix;
    in
      {
        darwinConfigurations.mbpro = darwin.lib.darwinSystem {
          modules = [ cachix darwin-configuration darwin.darwinModules.simple {nixpkgs.overlays = [ nur.overlay ]; } ];
          inputs = inputs;
        };

      };
}
