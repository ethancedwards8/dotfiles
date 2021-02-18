{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    cmake
    nodePackages.typescript
    nodePackages.typescript-language-server
    rnix-lsp
    rust-analyzer rls cargo



    haskell-language-server
  ];
}
