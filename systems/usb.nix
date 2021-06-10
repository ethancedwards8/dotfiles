inputs: { pkgs, ...}: {

  # TODO: Get home-manager to work.
  imports = [
    # inputs.home-manager.nixosModules.home-manager
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel.nix"
  ];
  # home-manager.users."ece" = import ../home-manager/modules/gpg.nix;
  # home-manager.useUserPackages = true;
  # home-manager.useGlobalPkgs = true;
  networking.hostName = "nixusb";
  system.stateVersion = "21.05";
  time.timeZone = "America/New_York";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.zfs.enableUnstable = true;
  boot.tmpOnTmpfs = true;
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
