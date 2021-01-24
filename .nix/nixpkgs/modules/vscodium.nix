{ config, pkgs, libs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = [ ];
  };
}
