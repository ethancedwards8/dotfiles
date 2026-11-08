{ inputs, lib, pkgs, ... }:
{
  home.stateVersion = "26.05";

  imports = [
    ./cli.nix
    ./misc-cli.nix
  ];
}
