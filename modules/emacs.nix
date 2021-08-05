{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    ((emacsPackagesNgGen emacsGit).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))
  ];

  services.emacs = {
    enable = true;
    package = pkgs.emacsGit.pkgs.withPackages (epkgs: [
      epkgs.vterm
    ]);
  };
}
