{ config, lib, pkgs, ... }:

{
  imports = [
    ./cachix.nix
    ./ece.nix
    ./emacs.nix
    ./fonts.nix
    ./networking.nix
    ./nix.nix
    ./pin-nixpkgs.nix
    ./security.nix
    ./shells.nix
    ./virtualisation.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
