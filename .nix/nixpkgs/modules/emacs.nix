{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    jetbrains-mono
  ];

  services.emacs.enable = true;

  programs.emacs = {
    enable = true;

    package = if pkgs.stdenv.isDarwin then pkgs.emacs else pkgs.emacs;
    extraPackages = (epkgs: [ epkgs.vterm ] );
  };
    
}
