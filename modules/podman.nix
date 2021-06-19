{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.ece.podman;
in
{
  options.ece.podman = {
    enable = mkEnableOption "Enable podman and related packages";
  };

  config = {
      virtualisation.podman.enable = true;
      environment.systemPackages = with pkgs; [ buildah skopeo ];
  };
}
