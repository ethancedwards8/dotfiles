{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    polybarFull
  ];

  home.file = {
    ".config/polybar" = {
      source = ../../.config/polybar;
      recursive = true;
    };
  };
}
