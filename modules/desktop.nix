{ config, lib, pkgs, ... }:

{
  services.trezord.enable = true;

  virtualisation.docker = {
    enable = true;
    liveRestore = false;
  };
  virtualisation.podman = {
    enable = true;
  };
  services.nomad.enable = true;
  services.nomad.extraPackages = with pkgs; [ nomad-driver-podman consul ];
  services.nomad.dropPrivileges = false;
  services.nomad.extraSettingsPaths = [ "/etc/nomad.hlc" ];
  environment.etc."nomad.hlc".source = pkgs.writeText "nomad.hcl.tpl" ''
      data_dir = "/var/lib/nomad"
      datacenter = "homelab-1"
      disable_update_check = true
      plugin_dir = "${pkgs.nomad-driver-podman}/bin"
      server {
             enabled = true
             bootstrap_expect = 1
      }
      client {
             enabled = true
             cni_path = "${pkgs.cni-plugins}/bin"
      }
      plugin "nomad-driver-podman" {
             config {
                    volumes {
                            enabled = true

                    }
             }
      }
      plugin "raw_exec" {
             config {
                    enabled = true
             }
      }
  '';

  networking.networkmanager.enable = true;
}
