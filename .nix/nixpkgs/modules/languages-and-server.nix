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
<<<<<<< HEAD
    rust-analyzer rls cargo



    haskell-language-server
=======

    rust-analyzer rls cargo rustc rustfmt

    yaml-language-server

    nodePackages.vscode-json-languageserver
>>>>>>> 43c8595efe483a21a218b1d0576c5c5b5ea5e57c
  ];
}
