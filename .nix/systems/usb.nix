{ pkgs, self, lib, inputs, ... }:

{
  nixpkgs.hostPlatform = "x86_64-linux";

  # TODO: Get home-manager to work.
  imports = [
    # inputs.home-manager.nixosModules.home-manager
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/common.nix
    ../modules/linux.nix
    ../modules/guix.nix
  ];

  networking.hostName = "nixusb";
  system.stateVersion = "25.11";
  time.timeZone = "America/New_York";

  boot.tmp.useTmpfs = true;
  services.pcscd.enable = true;
  services.udev.packages = with pkgs; [ yubikey-personalization ];
  environment.systemPackages = with pkgs; [ gnupg pinentry-curses paperkey ];

  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
}
