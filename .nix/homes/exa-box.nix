{ pkgs, self, lib, inputs, options, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tmux
    claude-code
    codex
    pi-coding-agent
    neovim
  ];

  home.username = "ece";
  home.homeDirectory = "/home/ece";
  home.stateVersion = "26.05";
}
