{
  description = "Ethan h-m flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay.url = "github:nix-community/emacs-overlay";

    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sysfo = {
      url = "github:ethancedwards8/sysfo";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovide = {
      url = "github:mjlbach/neovide-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    let
      overlays = [
          # (self: super: {
          #   lightcord = super.callPackage ./packages/lightcord {};
          # })
          inputs.neovim-nightly.overlay
          inputs.nur.overlay
          inputs.emacs-overlay.overlay
          inputs.sysfo.overlay
          # inputs.neovide.overlay
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
                ./modules/games.nix
                ./modules/gpg.nix
                ./modules/home-manager.nix
                ./modules/languages-and-server.nix
                ./modules/neovim.nix
                ./modules/nix-du.nix
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
                ./modules/games.nix
                ./modules/gpg.nix
                ./modules/home-manager.nix
                ./modules/languages-and-server.nix
                ./modules/linux-specific.nix
                ./modules/neomutt.nix
                ./modules/neovim.nix
                ./modules/nix-du.nix
                ./modules/polybar.nix
                ./modules/redshift.nix
                ./modules/terminals.nix
              ];
              # linux stuff
              services.emacs.enable = true;
              services.gpg-agent.enable = true;
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
