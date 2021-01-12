{ config, pkgs, libs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;
    # package = pkgs.neovim;
    extraConfig = builtins.readFile ./init.vim;

    plugins = with pkgs.vimPlugins; [
      fzf-vim
      vim-rooter
      vim-commentary 
      vim-css-color
      vim-fugitive
      # vifm
      lightline-vim #lightline.vim
      vim-highlightedyank
      vim-nix
      vimtex
      nerdtree
    ];

  };

}
