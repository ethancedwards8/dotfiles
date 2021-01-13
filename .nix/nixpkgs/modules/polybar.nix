{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    polybar
  ];

  home.file = {
    ".config/polybar" = {
      source = ../../../.config/polybar;
      recursive = true;
    };
  };
}
