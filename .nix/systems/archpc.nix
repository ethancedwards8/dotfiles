{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ../modules/packages.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  system-manager.allowAnyDistro = true;

  environment.systemPackages = with pkgs; [
    inputs.system-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  nix.settings.trusted-users = [
    "root"
    "ece"
    "@wheel"
  ];
  nix.settings.sandbox = true;
  nix.package = pkgs.nixVersions.latest;
  nix.extraOptions = ''
    experimental-features = nix-command flakes ca-derivations
    builders-use-substitutes = true
    auto-optimise-store = true
    sandbox = true
    extra-platforms = aarch64-darwin x86_64-darwin x86_64-linux i686-linux
  '';
}
