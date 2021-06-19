{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    layout = "us,es";
    xkbOptions = "grp:lalt_lshift_toggle";
    # xkbVariant = ",qwerty";

    windowManager = {
      bspwm.enable = true;
      exwm.enable = true;
      exwm.extraPackages = epkgs: [ epkgs.vterm ];
      awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };
    };

    desktopManager = {
      # plasma5.enable = true;
    };

    displayManager = {
      defaultSession = "none+bspwm";
      lightdm.enable = true;
    };

    libinput = {
      enable = true;
      mouse.middleEmulation = true;
    };
  };
  environment.systemPackages = with pkgs; [
    xorg.xbacklight
  ];

}
