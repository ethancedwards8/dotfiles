{ config, lib, pkgs, ... }:

{
  imports = [
    ./virtualisation.nix
  ];

  services.trezord.enable = true;

  ## I may not need this anymore, thanks proxmox :)
  # vm's
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };
}
