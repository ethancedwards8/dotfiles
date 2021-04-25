{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # lightcord
    anki
    godot
    discord
    firefox
    gnome3.nautilus
    i3lock
    monero
    monero-gui
    mpv
    nextcloud-client
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

    # nur.repos.ethancedwards8.st

    # nur.repos.ethancedwards8.dmenu
  ];

}
