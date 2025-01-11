{ pkgs, config, lib, inputs, ... }:

{

  programs.nix-index.enable = true;

  programs.direnv.enable = true;

  programs.bash.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    cachix
    curl
    git
    gnupg
    nix-health
    nix-info
    nixfmt-rfc-style
    nixpkgs-review
    pinentry-tty
    wget
  ];
}
