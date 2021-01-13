{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    bspwm
    sxhkd
    nitrogen
  ];

  home.file = {
    ".config/sxhkd/sxhkdrc".source = ../../../.config/sxhkd/sxhkdrc;
    ".config/bspwm/bspwmrc".source = ../../../.config/bspwm/bspwmrc;
  };

}
