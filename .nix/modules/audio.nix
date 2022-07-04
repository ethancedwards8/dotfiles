{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.ece.xserver;
in
{
  config = mkIf cfg.enable {
    sound.enable = true;
    hardware = {
      pulseaudio = {
        enable = true;
        package = pkgs.pulseaudioFull;
        support32Bit = true;
      };
      opengl.driSupport32Bit = true;
      bluetooth.enable = true;
    };
  };
}
