{ config, pkgs, ... }:

{
  services.trezord.enable = true;

  virtualisation.docker = {
    enable = true;
    liveRestore = false;
  };

  networking.networkmanager.enable = true;
}
