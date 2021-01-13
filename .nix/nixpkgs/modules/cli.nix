{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    bash-completion
    curl
    exa
    fzf
    htop
    ripgrep
    speedtest-cli
    tree
    wget
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
  programs.bash = {
    enable = true;
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
      # sensible
      # yank
      # dracula
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
