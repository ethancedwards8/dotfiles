{ config, pkgs, libs, ... }:

{
  programs.kitty = {
    enable = true;
    # extraConfig = builtins.readDir ../../../.config/kitty;
  };
}
