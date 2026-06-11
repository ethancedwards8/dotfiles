{ pkgs, config, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    awscli2

    cachix
    comma
    bat
    inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.dix
    eza
    fzf
    git
    git-lfs
    github-cli
    htop
    jq
    fastfetch
    nix-forecast
    nix-health
    nix-info
    nix-update
    nixfmt
    nixpkgs-reviewFull
    nixpkgs-track
    ripgrep
    starship

    inputs.nix-check-deps.packages.${pkgs.stdenv.hostPlatform.system}.nix-check-deps
  ];

  nixpkgs.overlays = [
    inputs.nur.overlays.default

    # inputs.system-manager.overlays.default
    # inputs.nix-check-deps.overlays.default
  ];

}
