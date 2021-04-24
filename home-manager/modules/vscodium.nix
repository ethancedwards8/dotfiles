{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    vscode
  ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = [ ];
  };
}
