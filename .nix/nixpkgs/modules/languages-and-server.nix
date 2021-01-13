{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    rnix-lsp
    rust-analyzer rls cargo
    nodePackages.typescript
    nodePackages.typescript-language-server

    cmake
  ];
}
