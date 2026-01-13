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

  programs.i3lock.enable = true;

  environment.systemPackages = with pkgs; [
    dmenu
    kitty
    nautilus
    firefox
    polybarFull
    nitrogen
    sxiv
    mpv
    i3lock
    acpilight
    # xbacklight
    xclip
    xss-lock
    zathura
    zotero
    signal-desktop
    scrot
  ];
}
