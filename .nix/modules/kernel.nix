{ pkgs, config, lib, inputs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

}
