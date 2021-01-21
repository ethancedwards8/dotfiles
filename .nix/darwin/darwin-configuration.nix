{ config, pkgs, lib, inputs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ 
    cachix
    kitty
    gimp
    wifi-password
  ];

  users.users.ece = {
    home = "/Users/ece";
    description = "Ethan Carter Edwards";
    shell = pkgs.bashInteractive;
  };

  homebrew = {
    enable = true;
  };

  security.pam.enableSudoTouchIdAuth = true;

  environment.shells = [ pkgs.bashInteractive pkgs.zsh ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/.nixpkgs/darwin-configuration.nix";

  services.emacs.enable = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.package = pkgs.nixFlakes;
  nix.buildCores = 4;
  nix.trustedUsers = [ "@admin" ];
  nix.extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes) 
  ''
    experimental-features = nix-command flakes
    auto-optimise-store = true
  '';

  programs.nix-index.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Create /etc/bashrc that loads the nix-darwin environment.
  # programs.zsh.enable = true;  # default shell on catalina
  programs.bash.enable = true;
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}