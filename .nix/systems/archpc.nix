{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ../modules/packages.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  system-manager.allowAnyDistro = true;

  environment.systemPackages = with pkgs; [
    inputs.system-manager
  ];
}
