{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))
  ];

  services.emacs = {
    enable = true;
    package = pkgs.emacs.pkgs.withPackages (epkgs: [
      epkgs.vterm
    ]);
  };

  services.xserver = {
    windowManager = {
      exwm.enable = pkgs.stdenv.isLinux;
      exwm.extraPackages = epkgs: [ epkgs.vterm ];
    };
  };
}
