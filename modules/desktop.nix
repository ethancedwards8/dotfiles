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
  services.nomad.extraSettingsPaths = [ "/etc/nomad.hlc" ];
  environment.etc."nomad.hlc".source = pkgs.writeText "nomad.hcl.tpl" ''
      datacenter = "homelab-1"
      data_dir = "/var/lib/nomad"
      server {
             enabled = true
             bootstrap_expect = 1
      }
      client {
             enabled = true
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
