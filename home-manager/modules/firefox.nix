{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos; [
      rycee.firefox-addons.ublock-origin
      ethancedwards8.firefox-addons.nextcloud-passwords
      rycee.firefox-addons.duckduckgo-privacy-essentials
      rycee.firefox-addons.privacy-badger
      rycee.firefox-addons.decentraleyes
      ethancedwards8.firefox-addons.enhancer-for-youtube
      ethancedwards8.firefox-addons.sponsorblock
      rycee.firefox-addons.clearurls
      rycee.firefox-addons.bitwarden
      rycee.firefox-addons.multi-account-containers
    ];
    profiles = {
      default = {
        name = "default";
        path = "k93pv3l6.default";
        id = 0;
      };
    };
  };
}
