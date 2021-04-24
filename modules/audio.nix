{ config, lib, pkgs, ... }:

{
  sound.enable = true;
  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
    };
    opengl.driSupport32Bit = true;
    # bluetooth.enable = true;
  };
}
