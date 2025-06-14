{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  # build machine
  boot.binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" "riscv64-linux" ];

  boot.supportedFilesystems = [ "zfs" ];

  # https://discourse.nixos.org/t/zfs-rollback-not-working-using-boot-initrd-systemd/37195
  boot.initrd.systemd.enable = lib.mkDefault true;
  boot.initrd.systemd.services.rollback = {
      description = "Rollback root filesystem to a pristine state on boot";
      wantedBy = [
        # "zfs.target"
        "initrd.target"
      ];
      after = [
        "zfs-import-rpool.service"
      ];
      before = [
        "sysroot.mount"
      ];
      path = with pkgs; [
        zfs
      ];
      unitConfig.DefaultDependencies = "no";
      serviceConfig.Type = "oneshot";
      script = ''
        zfs rollback -r rpool/local/root@blank && echo "  >> >> rollback complete << <<"
      '';
    };

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

  fileSystems."/gnu" =
    { device = "rpool/local/guix";
      fsType = "zfs";
      neededForBoot = true;
    };

  fileSystems."/home" =
    { device = "rpool/safe/home";
      fsType = "zfs";
      neededForBoot = true;
    };

  fileSystems."/nix/persist" =
    { device = "rpool/safe/persist";
      fsType = "zfs";
      neededForBoot = true;
    };

  swapDevices = [ ];
}
