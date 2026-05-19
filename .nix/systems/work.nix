{ pkgs, self, lib, inputs, options, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/darwin.nix
  ];

  security.pam.services.sudo_local.touchIdAuth = true;

  system.primaryUser = "ece";

  users.users.ece = {
    home = "/Users/ece";
    description = "Ethan Carter Edwards";
    shell = pkgs.bashInteractive;
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    masApps = {
      # Xcode = 497799835;
    };
    brews = [
      "atomicparsley"
      "bash"
      "ca-certificates"
      "exiftool"
      "eza"
      "ffmpeg"
      "fzf"
      "gh"
      "git"
      "git-lfs"
      "gnupg"
      "htop"
      "jq"
      "neovim"
      "nmap"
      "node"
      "pnpm"
      "ripgrep"
      "starship"
      "tmux"
      "uv"
      "wget"
      "yt-dlp"
    ];
    casks = [
      "brave-browser"
      "firefox"
      "kitty"
      "notion"
      "postman"
      "zed"
      "zotero"
    ];
  };

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}

