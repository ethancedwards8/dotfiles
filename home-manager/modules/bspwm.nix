{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    bspwm
    nitrogen
    sxhkd
  ];

  home.file = {
    ".config/sxhkd/sxhkdrc".source = ../../.config/sxhkd/sxhkdrc;
    ".config/bspwm/bspwmrc".source = ../../.config/bspwm/bspwmrc;
  };

}
