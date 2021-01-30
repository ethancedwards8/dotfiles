{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    graphviz
    nix-du
  ];
}
