{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    polybarFull
    # python2.pkgs.dbus-python
  ];

  home.file = {
    ".config/polybar" = {
      source = ../../../.config/polybar;
      recursive = true;
    };
  };
}
