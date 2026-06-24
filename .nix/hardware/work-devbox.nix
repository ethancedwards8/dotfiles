{ config, lib, pkgs, inputs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/amazon-image.nix")
  ];

  # amazon-image.nix enables amazon-init, which reapplies EC2 user-data on every boot.
  systemd.services.amazon-init.enable = lib.mkForce false;

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "xfs";
  };

  boot.loader.grub.device = lib.mkForce "nodev";
}
