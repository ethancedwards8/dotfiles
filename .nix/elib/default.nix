{ self
  , home-manager ? null
  , nixpkgs
  , inputs
  , pkgs
}@args:
let
  lib = nixpkgs.lib;
  nixosSystem = nixpkgs.lib.nixosSystem;
  homeManagerConfiguration = home-manager.lib.homeManagerConfiguration;

