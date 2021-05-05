{ config, pkgs, lib, ... }:
let
  inherit (config.ece.pkgs) nixpkgs;
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;
    extraConfig = builtins.readFile ./init.vim;

    plugins = with pkgs.vimPlugins; [
      fzf-vim
      lightline-vim #lightline.vim
      nerdtree
      # vifm
      vim-commentary
      vim-css-color
      vim-fugitive
      vim-highlightedyank
      vim-nix
      vim-rooter
      vimtex
    ];
  };
}
