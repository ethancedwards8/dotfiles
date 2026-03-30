{ pkgs, config, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    cachix
    comma
    bat
    dix
    eza
    fzf
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
    zathura

    inputs.nix-check-deps.packages.${pkgs.stdenv.hostPlatform.system}.nix-check-deps
  ];

  nixpkgs.overlays = [
    inputs.nur.overlays.default

    # inputs.system-manager.overlays.default
    # inputs.nix-check-deps.overlays.default
  ];

}
