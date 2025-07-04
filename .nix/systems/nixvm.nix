{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    ../hardware/nixvm.nix

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/linux.nix
    ../modules/guix.nix
  ];

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  services.tailscale.enable = true;

  networking.hostName = "nixvm";

  services.qemuGuest.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.11"; # Did you read the comment?
}
