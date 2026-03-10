{ pkgs, config, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    cachix
    comma
    bat
    dix
    eza
    fzf
    github-cli
    htop
    jq
    fastfetch
    nix-forecast
    nix-health
    nix-info
    nix-update
    nixfmt
    nixpkgs-reviewFull
    nixpkgs-track
    ripgrep
    starship
    zathura

    inputs.nix-check-deps.packages.${pkgs.stdenv.hostPlatform.system}.nix-check-deps

    (vscode-with-extensions.override {
      vscode = pkgs.vscodium;
      vscodeExtensions = with pkgs.vscode-extensions; [
        asvetliakov.vscode-neovim
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        ms-python.black-formatter
        ms-python.debugpy
        ms-python.isort
        ms-python.python
        svelte.svelte-vscode
        tamasfe.even-better-toml
      ];
    })
  ];

  nixpkgs.overlays = [
    inputs.nur.overlays.default

    # inputs.system-manager.overlays.default
    # inputs.nix-check-deps.overlays.default
  ];

}
