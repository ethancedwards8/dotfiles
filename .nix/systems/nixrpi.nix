{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    ../hardware/nixrpi.nix

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/linux.nix
  ];

  networking.hostName = "nixrpi";

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";

  system.stateVersion = "25.05";
}
