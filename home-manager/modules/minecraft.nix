{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    minecraft
    multimc
  ];
}
