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
    # package = pkgs.neovim;
    extraConfig = builtins.readFile ../config/init.vim;

    #vifm
    plugins = with pkgs.vimPlugins; [
      fzf-vim
      lightline-vim #lightline.vim
      nerdtree
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
