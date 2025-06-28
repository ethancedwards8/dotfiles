{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

{
  services.xserver = {
    enable = true;

    xkb.layout = "us";

    windowManager = {
      bspwm.enable = true;
    };

    displayManager.lightdm.enable = true;
  };

  services.displayManager = {
    defaultSession = "none+bspwm";
  };

  services.libinput = {
    enable = true;
    mouse.middleEmulation = true;
  };

  environment.systemPackages = with pkgs; [
    dmenu
    kitty
    firefox
    polybar
    nitrogen
    mpv
    xorg.xbacklight
  ];
}
