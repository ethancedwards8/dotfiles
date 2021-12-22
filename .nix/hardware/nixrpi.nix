{ config, lib, pkgs, ... }:

{

  # /tmp is tmpfs
  boot.tmpOnTmpfs = true;
  boot.cleanTmpDir = true;

  # Enable GPU acceleration
  hardware.raspberry-pi."4".fkms-3d.enable = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };
}
