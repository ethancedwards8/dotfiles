{ self
  , home-manager ? null
  , nixpkgs
  , darwin
  , inputs
  , pkgs
}@args:
let
  lib = nixpkgs.lib;
  nixosSystem = nixpkgs.lib.nixosSystem;
  darwinSystem = darwin.lib.darwinSystem;
  homeManagerConfiguration = home-manager.lib.homeManagerConfiguration;
in
