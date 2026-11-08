{ pkgs, config, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    awscli2
    ispell
    k9s
    kubectl
    modal

    comma
    eza
    fzf
    git
    git-lfs
    gnupg
    htop
    neovim
    nmap
    ripgrep
    wget
    starship
  ]
  ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [ nvtopPackages.apple btop ];

  nixpkgs.overlays = [
    # inputs.nur.overlays.default

    # inputs.system-manager.overlays.default
    # inputs.nix-check-deps.overlays.default
  ];

}
