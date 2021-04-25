{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    graphviz
    nix-du
  ];
}
