{ config, pkgs, lib, ... }:

let
  inherit (config.ece.pkgs) nixpkgs-stable;
in
{
  home.packages = with pkgs; [
    bash-completion
    cachix
    curl
    doctl
    exa
    file
    fzf
    htop
    jq
    # kubectl
    ncdu
    neofetch
    python
    ripgrep
    shellcheck
    speedtest-cli
    sqlite
    # nur.repos.ethancedwards8.sysfo
    tldr
    tree
    wget
    youtube-dl

    nixpkgs-stable.azure-cli
    terraform_0_15


    git-lfs
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ../../.bashrc;
    profileExtra = builtins.readFile ../../.bash_profile;
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  home.file.".config/starship.toml".source = ../../.config/starship.toml;

  programs.tmux = {
    enable = true;
    clock24 = true;
    # plugins = with pkgs.tmuxPlugins; [
    #   # sensible
    #   # yank
    #   dracula
    # ];
    extraConfig = builtins.readFile ./tmux.conf;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableNixDirenvIntegration = true;
  };

  programs.git.enable = true;
  programs.git.package = pkgs.gitFull;
  home.file.".gitconfig".source = ../../.gitconfig;
}
