{ config, pkgs, libs, ... }:

{
  home.packages = (with pkgs; [
    # clang
    cmake
    gnumake
    gcc

    haskell-language-server

    sumneko-lua-language-server

    python3
    pipenv
    python38Packages.python-language-server

    nodePackages.npm
    nodejs-slim

    rnix-lsp

    rust-analyzer rls cargo rustc rustfmt

    texlab

    yaml-language-server
  ]) ++ (with pkgs.nodePackages; [
    dockerfile-language-server-nodejs
    typescript
    typescript-language-server
    vscode-json-languageserver
  ]);
}
