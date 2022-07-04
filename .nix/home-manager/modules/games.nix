{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    flare
    typespeed
  ];
}
