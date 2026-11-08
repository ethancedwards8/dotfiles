{ lib, pkgs, inputs, ... }:

{
  imports = [
    ./cloud.nix
  ];

  home.packages = with pkgs; [
    devin-cli
    pi-coding-agent
    codex
    claude-code
  ];
}
