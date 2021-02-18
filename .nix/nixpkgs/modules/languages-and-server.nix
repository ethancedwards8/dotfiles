{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    cmake
    gcc
    # clang

    nodePackages.dockerfile-language-server-nodejs

    nodePackages.typescript
    nodePackages.typescript-language-server

    rnix-lsp

    rust-analyzer rls cargo rustc rustfmt

    yaml-language-server

    nodePackages.vscode-json-languageserver
  ];
}
