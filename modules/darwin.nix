{ config, lib, pkgs, ...}:

{
  imports = [
    ./pin-nixpkgs.nix
    ./nix.nix
    ./cachix.nix
    ./shells.nix
  ];
  services.nix-daemon.enable = true;
  programs.nix-index.enable = true;

  environment.systemPackages = with pkgs; [
    cachix
    curl

    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

    gimp
    git
    gnupg
    kitty
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

  services.emacs.enable = true;
  services.emacs.package = pkgs.emacs.pkgs.withPackages (epkgs: [
    epkgs.vterm
  ]);

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.bash.enable = true;

  system.stateVersion = 4;
}
