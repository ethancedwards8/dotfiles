{config, pkgs, ... }:

{
  services.openssh.enable = true;

  services.pcscd.enable = true;
  services.udev.packages = with pkgs; [ yubikey-personalization ];

  services.gnome3.gnome-keyring.enable = true;
  
  services.trezord.enable = true;

  virtualisation.docker = {
    enable = true;
    liveRestore = false;
  };

  networking.networkmanager.enable = true;
}
