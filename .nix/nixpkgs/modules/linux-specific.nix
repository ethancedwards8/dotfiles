{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    # lightcord
    nodePackages.ganache-cli
    discord
    gnome3.nautilus
    i3lock
    monero
    monero-gui
    mpv
    nixos-shell
    picard
    picom
    qutebrowser
    scrot
    slock
    spotify
    sxiv
    trezor-suite
    xss-lock
    zathura

    nextcloud-client
    # fix bad nextcloud version
    # (nextcloud-client.overrideAttrs (oldAttrs: rec { 
    #   version = "3.0.3";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "nextcloud";
    #     repo = "desktop";
    #     rev = "v${version}";
    #     sha256 = "0idh8i71jivdjjs2y62l22yl3qxwgcr0hf53dad587bzgkkkr223";
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
