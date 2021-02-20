{ config, pkgs, libs, ... }:

{
  programs.gpg = {
    enable = true;
  };

  home.file.".gnupg/gpg.conf".source = ../../../.gnupg/gpg.conf;
  home.file.".gnupg/gpg-agent.conf".text = ''
    enable-ssh-support
    default-cache-ttl 28800
    max-cache-ttl 28800
    pinentry-program /nix/var/nix/profiles/system/sw/bin/pinentry-curses
  '';
}
