{
  description = "Ethan's Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
        url = "github:LnL7/nix-darwin";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    inherit (nix-darwin.lib) darwinSystem;
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mbair
    darwinConfigurations."mbair" = darwinSystem (import ./systems/mbair.nix inputs);
    mbair = self.darwinConfigurations.mbair.config.system.build.toplevel;

  };
}
