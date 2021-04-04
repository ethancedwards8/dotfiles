{ pkgs, lib, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.nur.overlay ];
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.registry.nur.flake = inputs.nur;
}
