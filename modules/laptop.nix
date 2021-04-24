{config, pkgs, ... }:

{
  services.openssh.enable = true;

  services.pcscd.enable = true;
  services.udev.packages = with pkgs; [ yubikey-personalization ];

  services.gnome3.gnome-keyring.enable = true;

  networking.networkmanager.enable = true;
}
