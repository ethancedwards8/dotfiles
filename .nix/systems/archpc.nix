{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.hostPlatform = "x86_64-linux";

  system-manager.allowAnyDistro = true;

  environment.systemPackages = with pkgs; [
    cachix
    nix-health
    nix-info
    nixfmt-rfc-style
    nix-update
    nixpkgs-review
    github-cli
    inputs.system-manager.packages.x86_64-linux.system-manager
  ];
}
