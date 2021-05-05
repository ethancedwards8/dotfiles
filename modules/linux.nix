{ pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./cachix.nix
    ./ece.nix
    ./fonts.nix
    ./networking.nix
    ./nix.nix
    ./pin-nixpkgs.nix
    ./security.nix
    ./shells.nix
    ./xserver.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  environment.systemPackages = with pkgs; [
    cachix
    curl
    git
    gnupg
    pinentry-curses
    unzip
    wget
  ];
}
