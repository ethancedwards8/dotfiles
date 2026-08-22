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
    inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.starship

    inputs.nix-check-deps.packages.${pkgs.stdenv.hostPlatform.system}.nix-check-deps

    inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.nh
  ]
  ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [ nvtopPackages.apple btop ]
  ++ lib.optionals (pkgs.stdenv.hostPlatform.isLinux && config ? hardware.nvidia.open && config.hardware.nvidia.open == true) [ nvtopPackages.nvidia btop-cuda ];

  nixpkgs.overlays = [
    inputs.nur.overlays.default

    # inputs.system-manager.overlays.default
    # inputs.nix-check-deps.overlays.default
  ];

}
