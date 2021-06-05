{ config, lib, pkgs, ... }:

{
  services.trezord.enable = true;

  # vm's
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };
  virtualisation.libvirtd.enable = true;

  # containers
  virtualisation.docker = {
    enable = true;
    liveRestore = false;
  };
  virtualisation.podman = {
    enable = true;
  };
  #nomad
  services.nomad = {
    enable = true;
    extraPackages = with pkgs; [ nomad-driver-podman consul ];
    dropPrivileges = false;
    extraSettingsPaths = [ "/etc/nomad.hlc" ];
  };
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
}
