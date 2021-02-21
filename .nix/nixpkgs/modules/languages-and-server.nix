{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    cmake
    gcc
    # clang

    python3
    python38Packages.python-language-server

    nodePackages.dockerfile-language-server-nodejs

    nodePackages.typescript
    nodePackages.typescript-language-server

    rnix-lsp

    haskell-language-server

    rust-analyzer rls cargo rustc rustfmt

    yaml-language-server

    nodePackages.vscode-json-languageserver
  ];
}
