# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # boot loader stuffz
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Change the kernel to the latest
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # /tmp is tmpfs
  boot.tmpOnTmpfs = true;
  boot.cleanTmpDir = true;
  
  # intel microcode stuffz
  hardware.cpu.intel.updateMicrocode = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/ROOTFS";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/BOOTFS";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/SWAPFS"; }
    ];
}
