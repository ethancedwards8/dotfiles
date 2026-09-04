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

  nix.settings = {
    extra-substituters = [ "https://cache.internal.exa.ai" ];
    extra-trusted-public-keys = [ "exa-nix-s3-cache-1:mxdfgAYd0CqvvfP9XaOnE1i7lrUACRIIt68iShEGKCA=" ];
    netrc-file = "/etc/nix/netrc";
  };

  homebrew = {
    casks = [
      "1password"
      "claude-code"
      "codex"
      "cursor"
      "devin-cli"
      "linear"
      "notion"
      "signal"
      "slack"
    ];
  };

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}

