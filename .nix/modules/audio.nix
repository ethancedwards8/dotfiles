{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
    alsa-utils
    pavucontrol
  ];
}
