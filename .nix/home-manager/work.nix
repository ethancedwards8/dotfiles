{ lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    devin-cli
    pi-coding-agent
    codex
    claude-code
  ];
}
