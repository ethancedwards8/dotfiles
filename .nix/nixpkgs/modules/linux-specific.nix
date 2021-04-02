{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    # lightcord
    anki
    discord
    gnome3.nautilus
    i3lock
    monero
    monero-gui
    mpv
    nixos-shell
    nodePackages.ganache-cli
    picard
    picom
    qbittorrent
    qutebrowser
    scrot
    slock
    spotify
    sxiv
    trezor-suite
    xss-lock
    zathura

    # fix bad nextcloud version
    # (nextcloud-client.overrideAttrs (oldAttrs: rec { 
    #   version = "3.2.0-rc2";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "nextcloud";
    #     repo = "desktop";
    #     rev = "v${version}";
    #     sha256 = "7euKV6IODa0oMI9LYsr++n9bCHrYzxyzu3KmvzSjvTc=";
    # };
    # }))

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
