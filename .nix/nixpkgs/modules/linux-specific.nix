{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    gnome3.gnome-keyring
    mpv
    gnome3.nautilus
    i3lock
    # lightcord
    discord
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
      src = pkgs.fetchFromGitLab {
        owner = "ethancedwards";
        repo = "st-config";
        rev = "0eedc647ff2c4d19fdaa8c27d4ae0649e44b83e5";
        sha256 = "oojXFwuYJD9sfbntje9UQ//0bOBtGt0RyFeYwWV7eZo=";
      };
    }))

    (dmenu.overrideAttrs (oldAttrs: rec {
      src = pkgs.fetchFromGitLab {
        owner = "ethancedwards";
        repo = "dmenu-config";
        rev = "9cd6fe49998b48aa1b97e8b66d8895624b0ac897";
        sha256 = "Kqhf7+kl+izCyrcwW6LaNrbYFh23j1nmBN+7/ebOlA0=";
      };
    }))

  ];

}
