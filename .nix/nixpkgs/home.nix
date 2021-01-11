{ config, pkgs, ... }:

{
  nixpkgs.overlays = import ../overlays;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.file.".ghci".text = ''
    :set prompt "λ> "
  '';

  home.packages = with pkgs; [
    doc-repos

    fzf
    wget
    curl
    # language servers
    rnix-lsp
    rust-analyzer rls cargo
    nodePackages.typescript
    nodePackages.typescript-language-server

    neovim-nightly

    mpv

    speedtest-cli

    cmake
    exa
    ripgrep
    bash-completion
    tree
    # fzf
    htop
    ffmpeg
    # emacs
    nss
    # nss-cacert
    openssl
    bash-completion

    # gnupg stuffz
    # pinentry-curses
    # pinentry
  ];

  # services.gpg-agent = {
  #   enable = true;
  #   enableScDaemon = true;
  #   enableSshSupport = true;
  # };

  programs = {
    gpg = {
      enable = true;
      settings = {
        keyserver = "hkps://keyserver.ubuntu.com:443";
      };
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraConfig = ''
        syntax enable
        set nowrap number relativenumber
        set smartindent
        set incsearch
        set showcmd
        " set tabstop=8
        " set softtabstop=8
        " set shiftwidth=8
        set noexpandtab

        noremap <SPACE> <Nop>
        let mapleader = " "
        " jumping windows
        nnoremap <leader>wh :wincmd h<CR>
        nnoremap <leader>wj :wincmd j<CR>
        nnoremap <leader>wk :wincmd k<CR>
        nnoremap <leader>wl :wincmd l<CR>
        nnoremap <leader>wc :wincmd c<CR>
        nnoremap <leader>wv :wincmd v<CR>
        nnoremap <leader>ws :wincmd s<CR>
        nnoremap <leader>wo :wincmd o<CR>
        nnoremap <leader>n :FZF<CR>
        nnoremap <leader>e :Explore<CR>

        map <C-n> :NERDTreeToggle<CR>

        nnoremap <leader>gc :Gcommit<CR>
        nnoremap <leader>gu :Gpush<CR>
        nnoremap <leader>gp :Gpull<CR>
        nnoremap <leader>gs :G<CR>

        let g:rooter_patterns = ['.git']

        let g:tex_flavor = 'latex'
      '';
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

    tmux = {
      enable = true;
      clock24 = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        {
          plugin = dracula;
          extraConfig = ''
            set -g @dracula-border-contrast true
            set -g @dracula-show-network false
            # set -g @dracula-show-battery true
            set -g @dracula-military-time true
            set -g @dracula-show-weather false
            set -g @dracula-show-powerline false
            set -g @dracula-show-left-icon session
            set -g @dracula-cpu-usage true
            set -g @dracula-ram-usage true
            set -g @dracula-show-powerline true
            # set -g @dracula-show-flags true
            # set -g @dracula-show-time true
            set -g @dracula-refresh-rate 5
            set -g @dracula-show-fahrenheit false
          '';
        }
      ];
      extraConfig = ''
        set -g mouse on
        set -g prefix C-x
        bind C-x send-prefix
      '';
    };

    direnv = {
      enable = true;
      enableZshIntegration = false;
      enableNixDirenvIntegration = true;
    };

    git = {
      enable = true;
      userName = "Ethan Edwards";
      userEmail = "ethan@ethancedwards.com";
      signing.key = "0xF93DDAFA26EF2458";
      # signing.signByDefault = true;
      extraConfig = {
        core.editor = "nvim";
        color.ui = "auto";
        pull.rebase = false;

        # sendmail settings
        sendemail.smtpServer = "smtp.gmail.com";
        sendemail.smtpServerPort = "587";
        sendemail.smtpEncryption = "TLS";
        sendemail.smtpUser = "ethancarteredwards@gmail.com";
      };
    };

    bash = {
      enable = true;
      # enableCompletion = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      # enableFishIntegration = true;
      settings = {
        add_newline = false;
        line_break.disabled = true;
        git_status.enabled = true;
        cmd_duration.disabled = true;
        directory = {
          enabled = true;
          truncation_length = 4;
        };
        package.disabled = true;
      };
    };

  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
