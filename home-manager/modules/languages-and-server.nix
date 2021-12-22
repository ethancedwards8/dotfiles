{ config, pkgs, lib, ... }:

let
  inherit (config.ece.pkgs) nixpkgs-stable;
in
{
  home.packages = (with pkgs; [
    # clang
    cmake
    gnumake
    gcc
    clang-tools
    #bear

    cabal-install
    ghc
    # haskell-language-server
    stack

    python3
    pipenv
    python38Packages.python-language-server

    nodePackages.npm
    nodejs-slim

    rnix-lsp

    rust-analyzer rls /* cargo rustc */ rustfmt

    texlab

    yaml-language-server

    nixpkgs-stable.nodePackages.dockerfile-language-server-nodejs
  ]) ++ (with pkgs.nodePackages; [
    typescript
    typescript-language-server
    vscode-json-languageserver
  ]);
}
