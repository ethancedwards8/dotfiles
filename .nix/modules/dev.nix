{ pkgs, config, lib, inputs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    # not very veritas of you
    "claude-code"
  ];

  environment.systemPackages = with pkgs; [
    claude-code
    zed-editor

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
}
