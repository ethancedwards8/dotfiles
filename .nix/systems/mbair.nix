{ pkgs, self, lib, inputs, options, ... }:

let
  getDarwinApp' =
    x: y:
    assert
      lib.isDerivation x
      || throw "lib.meta.getDarwinApp': The first argument is of type ${lib.typeOf x}, but it should be a derivation instead.";
    assert
      lib.isString y
      || throw "lib.meta.getDarwinApp': The second argument is of type ${lib.typeOf y}, but it should be a string instead.";
    assert
      lib.hasInfix "/" y == false
      || throw "lib.meta.getDarwinApp': The second argument \"${y}\" is a nested path with a \"/\" character, but it should just be the name of the app instead.";
    assert
      lib.hasSuffix ".app" y
      || throw "lib.meta.getDarwinApp': The second argument \"${y}\" must end in `.app`";
    "${lib.getOutput "out" x}/Applications/${y}";
in
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
      app = getDarwinApp' anki-bin "Anki.app";
    }
    {
      app = getDarwinApp' kitty "kitty.app";
    }
    {
      app = getDarwinApp' firefox "Firefox.app";
    }
    {
      app = getDarwinApp' brave "Brave Browser.app";
    }
    {
      app = getDarwinApp' zotero "Zotero.app";
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
