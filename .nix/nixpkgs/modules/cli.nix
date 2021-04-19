{ config, pkgs, libs, ... }:

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
    sysfo
    tldr
    tree
    wget
    youtube-dl
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ../../../.bashrc;
    profileExtra = builtins.readFile ../../../.bash_profile;
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  home.file.".config/starship.toml".source = ../../../.config/starship.toml;

  programs.tmux = {
    enable = true;
    clock24 = true;
    # plugins = with pkgs.tmuxPlugins; [
    #   sensible
    #   yank
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
  home.file.".gitconfig".source = ../../../.gitconfig;
}
