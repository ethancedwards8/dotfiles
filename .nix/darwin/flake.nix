{
  description = "Ethan darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs }:
  let
    configuration = import ./darwin-configuration.nix;
  in
  {
    darwinConfigurations."Ethans-MacBook-Air" = darwin.lib.darwinSystem {
      modules = [ configuration darwin.darwinModules.simple ];
    };

    # expose the package set, including overlays, for convenience???
    darwinPackages = self.darwinConfigurations."Ethans-MacBook-Air".pkgs;
  };


}
