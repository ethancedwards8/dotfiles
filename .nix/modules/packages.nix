{ pkgs, config, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    cachix
    comma
    github-cli
    nix-forecast
    nix-health
    nix-info
    nix-update
    nixfmt-rfc-style
    nixpkgs-review

    inputs.nix-check-deps
  ];

}
