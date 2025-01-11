{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.impermanence

    ../hardware/nixvm.nix

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/common.nix
  ];

  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/NetworkManager/system-connections"
      "/var/log"
      "/var/lib/systemd/coredump"
    ];
    # files = [
    #   "/etc/machine-id"
    #   "/etc/ssh/ssh_host_ed25519_key"
    #   "/etc/ssh/ssh_host_ed25519_key.pub"
    #   "/etc/ssh/ssh_host_rsa_key"
    #   "/etc/ssh/ssh_host_rsa_key.pub"
    # ];
  };

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.ece = {
      isNormalUser = true;
      initialPassword = "hunter2";
      createHome = true;
      home = "/home/ece";
      shell = pkgs.bashInteractive;
      extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" "libvirtd" "vboxusers" ];
  };

  networking.hostName = "nixvm";

  services.openssh.enable = true;

  services.qemuGuest.enable = true;

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "24.11"; # Did you read the comment?
}
