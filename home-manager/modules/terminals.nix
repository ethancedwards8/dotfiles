{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ../../.config/kitty/kitty.conf;
  };

  home.file.".config/kitty/nord.conf".source = ../../.config/kitty/nord.conf;
}
