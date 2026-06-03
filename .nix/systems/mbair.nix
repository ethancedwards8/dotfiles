{ pkgs, self, lib, inputs, options, ... }:

{
  imports = [
    ../modules/cachix.nix
    ../modules/darwin.nix
  ];

  system.primaryUser = "ece";

  users.users.ece = {
    home = "/Users/ece";
    description = "Ethan Carter Edwards";
    shell = pkgs.bashInteractive;
  };

  homebrew = {
    masApps = {
      # sad
      "Microsoft Excel" = 462058435;
      "Microsoft PowerPoint" = 462062816;
      "Microsoft Word" = 462054704;
      # PassioGo = 1203861956; https://github.com/mas-cli/mas/issues/321
      Xcode = 497799835;
    };
    brews = [
      "atomicparsley"
      "emacs"
      "exiftool"
      "ispell"
      "yt-dlp"
    ];
    casks = [
      "anki"
      "audacity"
      "element"
      "fastmail"
      "hamrs-pro"
      "joplin"
      "kdenlive"
      "signal"
      "tailscale-app"
      "vlc"
    ];
  };

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
