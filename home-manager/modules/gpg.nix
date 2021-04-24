{ config, pkgs, libs, ... }:

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
    enable = true;
    enableSshSupport = true;
    enableScDaemon = true;
    enableExtraSocket = true;
    defaultCacheTtl = 28800;
    maxCacheTtl = 28800;
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
