{ config, lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = true;
  networking.extraHosts = ''
    192.168.7.76 rpi1
    192.168.7.77 rpi2
    192.168.7.78 rpi3
    192.168.7.79 rpi4
    192.168.7.207 fedora
    192.168.7.247 nixlaptop
    192.168.7.248 nixpc
  '';
}
