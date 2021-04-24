{ config, lib, pkgs, ... }:

{
  security.doas.enable = true;
  security.pam.services.ece.gnupg.enable = true;

  services.openssh.enable = true;

  services.pcscd.enable = true;
  services.udev.packages = with pkgs; [ yubikey-personalization ];
  programs.ssh.startAgent = false;
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services.gnome3.gnome-keyring.enable = true;
}
