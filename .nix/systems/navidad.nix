{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    ../hardware/navidad.nix

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/linux.nix
    ../modules/guix.nix
  ];

  services.tailscale.enable = true;

  networking.hostName = "navidad";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.11"; # Did you read the comment?
}
