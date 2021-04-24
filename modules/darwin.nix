{ config, lib, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    cachix

    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

    gimp
    kitty
    mpv
    pinentry-curses
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

  services.nix-daemon.enable = true;

  nix.package = pkgs.nixUnstable;
  nix.buildCores = 4;
  nix.trustedUsers = [ "@admin" ];
  nix.extraOptions =
  ''
    experimental-features = nix-command flakes
    auto-optimise-store = true
  '';

  programs.nix-index.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.bash.enable = true;

  system.stateVersion = 4;
}
