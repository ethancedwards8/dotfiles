{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    ../hardware/veritas.nix

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/linux.nix
    ../modules/guix.nix
    ../modules/xserver.nix
    ../modules/audio.nix
    ../modules/bluetooth.nix
  ];

  services.tailscale.enable = true;

  programs.nix-ld.enable = true;

  powerManagement.enable = true;

  networking.hostName = "veritas";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.11"; # Did you read the comment?
}
