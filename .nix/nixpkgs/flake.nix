{
  description = "Ethan h-m flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    emacs-overlay.url = "github:nix-community/emacs-overlay";

    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    let
      overlays = [
          inputs.neovim-nightly.overlay
          inputs.nur.overlay
          inputs.emacs-overlay.overlay
      ];
    in
    {
      homeConfigurations = {
        macbook-air = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, ... }:
            {
              nixpkgs.config = import ./modules/config.nix;
              nixpkgs.overlays = overlays;
              imports = [
                # ./home.nix
                ./modules/cli.nix
                ./modules/emacs.nix
                ./modules/home-manager.nix
                ./modules/languages-and-server.nix
                ./modules/neovim.nix
                ./modules/vscodium.nix
              ];
            };
          system = "x86_64-darwin";
          homeDirectory = "/Users/ece";
          username = "ece";
          # homeDirectory = "/Users/ece";
          # username = "ece";
        };
        linux = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, ... }:
            {
              nixpkgs.overlays = overlays;
              nixpkgs.config = import ./modules/config.nix;
              imports = [
                # ./home.nix
                ./modules/bspwm.nix
                ./modules/cli.nix
                ./modules/emacs.nix
                ./modules/firefox.nix
                ./modules/home-manager.nix
                ./modules/languages-and-server.nix
                ./modules/linux-specific.nix
                ./modules/neovim.nix
                ./modules/polybar.nix
                ./modules/terminals.nix
              ];
            };
          system = "x86_64-linux";
          homeDirectory = "/home/ece";
          username = "ece";
        };
      };
      macbook-air = self.homeConfigurations.macbook-air.activationPackage;
      linux = self.homeConfigurations.linux.activationPackage;
    };
}
