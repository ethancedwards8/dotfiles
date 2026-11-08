{ lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    hydra-check
    fastfetch
    nix-forecast
    nix-health
    nix-info
    nix-update
    nixpkgs-track

    jujutsu
    mdcat
    yt-dlp
    exiftool
    atomicparsley
  ];
}
