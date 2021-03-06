{ config, pkgs, lib, stdenv, ... }:

{
  programs.gpg = {
    enable = true;
    settings = {
      keyserver = "hkps://keyserver.ubuntu.com:443";
      no-greeting = true;
      throw-keyids = true;
      default-key = "0x091F7337F9BD5E4E";
    };
  };
  services.gpg-agent = {
    enable = pkgs.stdenv.isLinux;
    enableScDaemon = true;
    extraConfig = ''
      enable-ssh-support
      default-cache-ttl 28800
      max-cache-ttl 28800
    '';
  };

  # home.packages = with pkgs; [
  #   gnupg
  # ];
  # home.file.".gnupg/gpg.conf".source = ../../.gnupg/gpg.conf;
  # home.file.".gnupg/gpg-agent.conf".text = ''
  #   enable-ssh-support
  #   default-cache-ttl 28800
  #   max-cache-ttl 28800
  #   pinentry-program /nix/var/nix/profiles/system/sw/bin/pinentry-curses
  # '';
}
