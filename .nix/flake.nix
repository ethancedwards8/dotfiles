{
  description = "Ethan's Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;

      mkNixos = modules: nixpkgs.lib.nixosSystem {
        inherit modules;
        specialArgs = { inherit inputs outputs self; };
      };

      mkDarwin = system: modules: nix-darwin.lib.darwinSystem {
          inherit system modules;
          specialArgs = { inherit inputs outputs self; };
        };

      mkUsb = system: configuration: import "${inputs.nixpkgs}/nixos" { inherit configuration system; };
      mkSd = system: configuration: import "${inputs.nixpkgs}/nixos" { inherit configuration system; };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#mbair
      darwinConfigurations."mbair" = mkDarwin "aarch64-darwin" [ ./systems/mbair.nix ];
      mbair = self.darwinConfigurations.mbair.config.system.build.toplevel;

      nixosConfigurations.nixrpi = mkNixos [ ./systems/nixrpi.nix ];
      nixrpi = self.nixosConfigurations.nixrpi.config.system.build.toplevel;

      nixosConfigurations.nixvm = mkNixos [ ./systems/nixvm.nix ];
      nixvm = self.nixosConfigurations.nixvm.config.system.build.toplevel;

      # build usb with .#usb.<system>
      usb = forAllSystems (system: (import "${inputs.nixpkgs}/nixos" {
        inherit system;
        configuration = (import ./systems/usb.nix inputs system);
      }).config.system.build.isoImage);

      darwinPackages = self.darwinConfigurations.mbair.pkgs;

      devShell = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        with pkgs;
        mkShell {
          name = "config shell";
          buildInputs = [ neovim nixfmt-rfc-style git ];
          # shellHook = '' ${git}/bin/git pull origin master '';
        }
      );


    };
}
