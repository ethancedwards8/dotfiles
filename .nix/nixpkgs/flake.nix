{
  description = "Ethan h-m flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    emacs-overlay.url = "github:nix-community/emacs-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    let
      overlays = [
          inputs.neovim-nightly.overlay
          inputs.emacs-overlay.overlay
      ];
    in
    {
      homeConfigurations = {
        macbook-air = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, ... }:
            {
              nixpkgs.overlays = overlays;
              imports = [
                # ./home.nix
                ./modules/home-manager.nix
                ./modules/languages-and-server.nix
                ./modules/cli.nix
                ./modules/neovim.nix
                ./modules/emacs.nix
              ];
            };
          system = "x86_64-darwin";
          homeDirectory = "/Users/ece";
          username = "ece";
          # homeDirectory = "/Users/ece";
          # username = "ece";
        };
      };
      macbook-air = self.homeConfigurations.macbook-air.activationPackage;
    };
}
