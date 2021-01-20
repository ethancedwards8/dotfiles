{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    jetbrains-mono
  ];

  # services.emacs.enable = if pkgs.stdenv.isDarwin then true else false;
  # if pkgs.stdenv.isLinux then services.emacs.enable = true;

  programs.emacs = {
    enable = true;

    package = if pkgs.stdenv.isDarwin then pkgs.emacs else pkgs.emacs;
    extraPackages = (epkgs: [ epkgs.vterm ] );
  };
    
}
