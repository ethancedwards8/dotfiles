{ pkgs, config, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    awscli2
    ispell
    # yt-dlp
    exiftool
    atomicparsley
    k9s
    kubectl

    cachix
    comma
    bat
    inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.dix
    eza
    fzf
    git
    jj
    git-lfs
    github-cli
    gnupg
    htop
    jq
    fastfetch
    nix-forecast
    nix-health
    nix-info
    nix-update
    nixfmt
    neovim
    nmap
    nodejs
    nixpkgs-reviewFull
    nixpkgs-track
    tmux
    ripgrep
    wget
    inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.starship

    inputs.nix-check-deps.packages.${pkgs.stdenv.hostPlatform.system}.nix-check-deps

    inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.nh
  ]
  ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [ nvtopPackages.apple btop ];

  nixpkgs.overlays = [
    inputs.nur.overlays.default

    # inputs.system-manager.overlays.default
    # inputs.nix-check-deps.overlays.default
  ];

}
