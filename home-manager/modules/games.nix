{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    flare
    typespeed
  ];
}
