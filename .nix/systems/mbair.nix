{ pkgs, self, lib, inputs, options, ... }:

let
  getSystemApp = app: "/Applications/Nix Apps/${app}";
in
{
  imports = [
    ../modules/darwin.nix
  ];

  system.primaryUser = "ece";
  nixpkgs.overlays = [
    (final: prev: {
      rio = prev.rio.overrideAttrs (old: rec {
        version = "0.5.24";
        src = final.fetchFromGitHub {
          owner = "raphamorim";
          repo = "rio";
          tag = "v${version}";
          hash = "sha256-71LP6Jy9C+XI0wIiUIuMqcVj3QrPHz1w5oc5JuesNwE=";
        };
        cargoDeps = final.rustPlatform.fetchCargoVendor {
          inherit (old) pname;
          inherit version src;
          hash = "sha256-7j7h7UEj6lJDct9Q/L7JXQ5xPgSrVpwaN8xOwchCDIo=";
        };
        doCheck = false;
      });
    })
  ];

  users.users.ece = {
    home = "/Users/ece";
    description = "Ethan Carter Edwards";
    shell = pkgs.bashInteractive;
  };

  programs.mas = {
    enable = true;
    packages = {
      # sad
      "Microsoft Excel" = 462058435;
      "Microsoft PowerPoint" = 462062816;
      "Microsoft Word" = 462054704;
      # PassioGo = 1203861956; https://github.com/mas-cli/mas/issues/321
      Xcode = 497799835;
    };
  };

  system.defaults.dock.persistent-apps = with pkgs; [
    {
      app = getSystemApp "Anki.app";
    }
    {
      app = getSystemApp "kitty.app";
    }
    {
      app = getSystemApp "Firefox.app";
    }
    {
      app = getSystemApp "Brave Browser.app";
    }
    {
      app = getSystemApp "Zotero.app";
    }
  ];

  environment.systemPackages = with pkgs; [
    anki-bin
    kitty
    firefox
    brave
    zotero
  ];

  homebrew = {
    casks = [
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
