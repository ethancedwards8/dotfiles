{ config, pkgs, libs, ... }:

{
  programs.emacs = {
    enable = true;

    package = if pkgs.stdenv.isDarwin then pkgs.emacs else pkgs.emacsPgtkGcc;
    extraPackages = (epkgs: [ epkgs.vterm ] );
  };
    
}
