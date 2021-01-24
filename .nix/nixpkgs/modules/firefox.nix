{ config, pkgs, libs, ... }:

{
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      # TODO: nextcloud passwords
      duckduckgo-privacy-essentials
      privacy-badger
      decentraleyes
      # TODO: enhancer for youtube
      # TODO: sponsorblock
      clearurls
      bitwarden
      multi-account-containers
    ];
  };
}
