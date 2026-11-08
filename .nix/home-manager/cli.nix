{ lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    bat
    cachix
    comma
    direnv
    dix
    eza
    fastfetch
    fzf
    git
    git-lfs
    github-cli
    htop
    jq
    neovim
    nh
    nix-check-deps
    nix-direnv
    nixfmt
    nixpkgs-reviewFull
    ripgrep
    rsync
    starship
    tmux
    zoxide
  ];
}
