{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    gnome3.gnome-keyring
    mpv
    gnome3.nautilus
    i3lock
    lightcord
    minecraft
    multimc
    nextcloud-client
    nixos-shell
    picom
    qutebrowser
    scrot
    slock
    spotify
    sxiv
    xss-lock
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
