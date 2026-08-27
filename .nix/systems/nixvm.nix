{ pkgs, self, lib, inputs, config, ... }:

{
  imports = [
    ../hardware/nixvm.nix

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/linux.nix
    ../modules/guix.nix
    ../modules/cuda.nix

    ../modules/k3s.nix
  ];

  hardware.nvidia.open = lib.mkForce false;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  services.tailscale.enable = true;

  networking.hostName = "nixvm";

  services.qemuGuest.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.11"; # Did you read the comment?
}
