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
      # sad
      "Microsoft Excel" = 462058435;
      "Microsoft PowerPoint" = 462062816;
      "Microsoft Word" = 462054704;
      Xcode = 497799835;
    };
    brews = [
      "atomicparsley"
      "bash"
      "ca-certificates"
      "emacs"
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
      "anki"
      "audacity"
      "brave-browser"
      "element"
      "fastmail"
      "firefox"
      "gcloud-cli"
      "ghostty"
      "hamrs-pro"
      "joplin"
      "kdenlive"
      "kitty"
      "notion"
      "postman"
      "signal"
      "tailscale-app"
      "vlc"
      "zed"
      "zotero"
    ];
  };

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
