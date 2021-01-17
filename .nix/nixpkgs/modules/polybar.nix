{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    polybar
    # python2.pkgs.dbus-python
  ];

  home.file = {
    ".config/polybar" = {
      source = ../../../.config/polybar;
      recursive = true;
    };
  };
}
