{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.hostPlatform = "x86_64-linux";

  system-manager.allowAnyDistro = true;

  environment.systemPackages = with pkgs; [
    nixpkgs-review
    nixfmt-rfc-style
    inputs.system-manager.packages.x86_64-linux.system-manager
  ];
}
