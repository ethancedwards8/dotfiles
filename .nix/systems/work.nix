{ pkgs, self, lib, inputs, options, ... }:

{
  imports = [
    ../modules/cachix.nix
    ../modules/darwin.nix
  ];

  environment.systemPackages = with pkgs; [
    pi-coding-agent

    ollama
  ];

  system.primaryUser = "ece";

  users.users.ece = {
    home = "/Users/ece";
    description = "Ethan Carter Edwards";
    shell = pkgs.bashInteractive;
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    brews = [
      "awscli"
    ];
    casks = [
      "1password"
      "claude-code"
      "codex"
      "cursor"
      "devin-cli"
      "linear"
      "notion"
      "slack"
      "windsurf"
    ];
  };

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}

