{ pkgs, config, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    cachix
    comma
    eza
    fzf
    github-cli
    # nix-check-deps
    nix-forecast
    nix-health
    nix-info
    nix-update
    nixfmt-rfc-style
    nixpkgs-review
    starship

    inputs.nix-check-deps.packages.${pkgs.system}.nix-check-deps
  ];

  nixpkgs.overlays = [
    inputs.nur.overlays.default

    # inputs.system-manager.overlays.default
    # inputs.nix-check-deps.overlays.default
  ];

}
