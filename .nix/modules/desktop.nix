{ config, lib, pkgs, ... }:

let
  inherit (config.ece.pkgs) nixpkgs-stable;
in
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
      package = nixpkgs-stable.virtualbox;
      enableExtensionPack = true;
    };
  };
}
