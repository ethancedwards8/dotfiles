{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/common.nix
  ];
}
