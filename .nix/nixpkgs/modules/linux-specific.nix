{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    lightcord
    nextcloud-client
    nur.repos.mic92.nixos-shell
    qutebrowser
    spotify
    sxiv
    zathura

    (st.overrideAttrs (oldAttrs: rec {
      src = fetchGit {
        url = "https://gitlab.com/ethancedwards/st-config";
        rev = "0eedc647ff2c4d19fdaa8c27d4ae0649e44b83e5";
        ref = "master";
      };
    }))

    (dmenu.overrideAttrs (oldAttrs: rec {
      src = fetchGit {
        url = "https://gitlab.com/ethancedwards/dmenu-config";
        rev = "9cd6fe49998b48aa1b97e8b66d8895624b0ac897";
        ref = "master";
      };
    }))

  ];

}
