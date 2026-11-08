{ pkgs, self, lib, inputs, options, ... }:

{
  imports = [
    ../modules/cachix.nix
    ../modules/darwin.nix
  ];

  home-manager.users.ece.imports = [
    ../home-manager/common.nix
    ../home-manager/cloud.nix
  ];

  nix.settings = {
    extra-substituters = [ "https://cache.internal.exa.ai" ];
    extra-trusted-public-keys = [ "exa-nix-s3-cache-1:mxdfgAYd0CqvvfP9XaOnE1i7lrUACRIIt68iShEGKCA=" ];
    netrc-file = "/etc/nix/netrc";
  };

  homebrew = {
    casks = [
      "1password"
      "cursor"
      "linear"
      "notion"
      "signal"
      "slack"
    ];
  };

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}

