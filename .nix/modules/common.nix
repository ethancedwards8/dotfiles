{ pkgs, config, lib, inputs, ... }:

{
  programs.direnv.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    cachix
    nix-health
    nix-info
    nixfmt-rfc-style
    nixpkgs-review
  ];
}
