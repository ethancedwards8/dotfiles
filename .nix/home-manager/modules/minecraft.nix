{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    minecraft
    multimc
  ];
}
