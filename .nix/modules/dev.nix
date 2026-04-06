{ pkgs, config, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
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
