{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    jetbrains-mono
    mu
  ];

  programs.emacs = {
    enable = true;
    # package = if pkgs.stdenv.isDarwin then pkgs.emacs else pkgs.emacs;
    package = pkgs.emacsGit;
    extraPackages = (epkgs: [ epkgs.vterm ] );
  };
    
}
