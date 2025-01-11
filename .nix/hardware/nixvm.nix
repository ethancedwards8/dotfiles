{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r rpool/local/root@blank
  '';

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  boot.zfs.devNodes = "/dev/disk/by-label/rpool";

  networking.hostId = "ac4c7185";

  fileSystems."/" =
    { device = "rpool/local/root";
      fsType = "zfs";
      neededForBoot = true;
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/E198-1996";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/nix" =
    { device = "rpool/local/nix";
      fsType = "zfs";
      neededForBoot = true;
    };

  fileSystems."/home" =
    { device = "rpool/safe/home";
      fsType = "zfs";
      neededForBoot = true;
    };

  fileSystems."/persist" =
    { device = "rpool/safe/persist";
      fsType = "zfs";
      neededForBoot = true;
    };

  swapDevices = [ ];
}
