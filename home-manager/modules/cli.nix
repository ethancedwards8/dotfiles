{ config, pkgs, lib, ... }:

let
  inherit (config.ece.pkgs) nixpkgs-stable;
in
{
  home.packages = with pkgs; [
    bash-completion
    tshark
    lsof
    cachix
    curl
    doctl
    # hydra-check
    exa
    file
    fzf
    htop
    jq
    ncdu
    neofetch
    nix-tree
    python
    ripgrep
    shellcheck
    speedtest-cli
    sqlite
    tldr
    ispell
    tree
    wget
    youtube-dl

    ansible
    sshpass

    # nixpkgs-stable.azure-cli
    terraform_0_15

    nixpkgs-stable.git-lfs
  ];

  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ../../.bashrc;
    profileExtra = builtins.readFile ../../.bash_profile;
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = false;
    enableZshIntegration = false;
  };
  home.file.".config/starship.toml".source = ../../.config/starship.toml;

  programs.tmux = {
    enable = true;
    clock24 = true;
    # plugins = with pkgs.tmuxPlugins; [
    #   sensible
    #   yank
    #   dracula
    # ];
    extraConfig = builtins.readFile ../config/tmux.conf;
  };

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
      enableFlakes = true;
    };
    enableBashIntegration = true;
    enableFishIntegration = false;
    enableZshIntegration = false;
  };

  # programs.piston-cli = {
  #   enable = pkgs.stdenv.isLinux;
  #   # package = pkgs.piston-cli-unstable;
  #   settings = {
  #     theme = "emacs";
  #     box_style = "ASCII";
  #   };
  # };

  home.file.".gitconfig".source = ../../.gitconfig;
  programs.git = {
    enable = true;
    package = nixpkgs-stable.gitFull;
    extraConfig = {
      credential.helper = "${
        nixpkgs-stable.gitFull.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };

  home.file.".ghci".source = ../../.ghci;
}
