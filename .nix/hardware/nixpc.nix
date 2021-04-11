# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # boot loader stuffz
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      version = 2;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  # Change the kernel to the latest
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # /tmp is tmpfs
  boot.tmpOnTmpfs = true;
  boot.cleanTmpDir = true;

  # amd microcode stuffz
  hardware.cpu.amd.updateMicrocode = true;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ae5b69e7-df2a-4be3-96c3-a551a9df3c43";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4CAE-3975";
      fsType = "vfat";
    };

  fileSystems."/hdd" =
    { device = "/dev/disk/by-uuid/5ADADB54DADB2AD1";
      fsType = "ntfs";
      options = [ "rw" "uid=100" ];
    };

  swapDevices = [ { device = "/swapfile"; size = 2048 * 4; }];

}
