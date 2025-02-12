{ pkgs, config, lib, inputs, ... }:

{
  programs.direnv.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nixpkgs.overlays = [ inputs.nur.overlays.default ];

  environment.systemPackages = with pkgs; [
    cachix
    nix-health
    nix-info
    nixfmt-rfc-style
    nix-update
    nixpkgs-review
    github-cli
  ];
}
