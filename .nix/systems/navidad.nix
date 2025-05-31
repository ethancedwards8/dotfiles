{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/linux.nix
    ../modules/guix.nix
  ];

  services.tailscale.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.05"; # Did you read the comment?
}
