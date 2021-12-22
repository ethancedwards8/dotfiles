{ config, lib, pkgs, ...}:

let
  inherit (config.ece.pkgs) nixpkgs-stable;
in
{
  imports = [
    ./cachix.nix
    ./emacs.nix
    ./nix.nix
    ./pin-nixpkgs.nix
    ./shells.nix
  ];
  services.nix-daemon.enable = true;
  programs.nix-index.enable = true;
  programs.nix-index.package = nixpkgs-stable.nix-index;

  environment.systemPackages = with pkgs; [
    cachix
    curl
    git
    gnupg
    nixpkgs-stable.kitty
    mpv
    pinentry-curses
    unzip
    wget
    wifi-password
  ];

  users.users.ece = {
    home = "/Users/ece";
    description = "Ethan Carter Edwards";
    shell = pkgs.bashInteractive;
  };
  users.nix.configureBuildUsers = true;

  homebrew = {
    enable = true;
    casks = [ "godot" ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.bash.enable = true;

  system.stateVersion = 4;
}
