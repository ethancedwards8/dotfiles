{ pkgs, self, lib, inputs, ... }:

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
    onActivation.cleanup = "uninstall";
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
      "ispell"
      "jq"
      "mas"
      "neofetch"
      "neomutt"
      "neovim"
      "nmap"
      "node"
      "pinentry"
      "pnpm"
      "podman"
      "poetry"
      "ripgrep"
      "starship"
      "tmux"
      "toot"
      "uv"
      "wget"
      "yt-dlp"
    ];
    casks = [
      "element"
      "emacs"
      "firefox"
      "ghostty"
      "kdenlive"
      "kitty"
      "postman"
      "signal"
      "tailscale"
      "vlc"
    ];
    masApps = {
    };
  };

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
