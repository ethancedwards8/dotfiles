{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # abook
    curl
    isync
    lynx
    msmtp
    neomutt
    notmuch
    pass
    protonmail-bridge
  ];
}
