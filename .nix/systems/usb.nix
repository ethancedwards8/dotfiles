inputs: system: { pkgs, self, lib, ... }:

{
  # better way to do this?
  nixpkgs.buildPlatform = "x86_64-linux";
  nixpkgs.hostPlatform = system;
  # nixpkgs.crossSystem = { inherit system; };

  # TODO: Get home-manager to work.
  imports = [
    # inputs.home-manager.nixosModules.home-manager
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel.nix"
    # ../modules/nix.nix
    # ../modules/cachix.nix
    # ../modules/common.nix
  ];
  # home-manager.users."ece" = import ../home-manager/modules/gpg.nix;
  # home-manager.useUserPackages = true;
  # home-manager.useGlobalPkgs = true;

  networking.hostName = "nixusb";
  system.stateVersion = "24.11";
  time.timeZone = "America/New_York";

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
  boot.zfs.package = pkgs.zfs_unstable;
  boot.tmp.useTmpfs = true;
  services.pcscd.enable = true;
  services.udev.packages = with pkgs; [ yubikey-personalization ];
  environment.systemPackages = with pkgs; [ gnupg pinentry-curses paperkey ];
  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
