{
  description = "Ethan's Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-check-deps = {
      url = "github:LordGrimmauld/nix-check-deps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, system-manager, ... }:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;

      mkNixos = system: modules: nixpkgs.lib.nixosSystem {
        inherit system modules;
        specialArgs = { inherit inputs outputs self; };
      };

      mkDarwin = system: modules: nix-darwin.lib.darwinSystem {
          inherit system modules;
          specialArgs = { inherit inputs outputs self; };
        };

      mkSystem = modules: system-manager.lib.makeSystemConfig {
          inherit modules;
          extraSpecialArgs = { inherit inputs outputs self; };
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#mbair
      darwinConfigurations."mbair" = mkDarwin "aarch64-darwin" [ ./systems/mbair.nix ];
      mbair = self.darwinConfigurations.mbair.config.system.build.toplevel;

      nixosConfigurations.veritas = mkNixos "x86_64-linux" [ ./systems/veritas.nix ];
      veritas = self.nixosConfigurations.veritas.config.system.build.toplevel;

      nixosConfigurations.navidad = mkNixos "x86_64-linux" [ ./systems/navidad.nix ];
      navidad = self.nixosConfigurations.navidad.config.system.build.toplevel;

      nixosConfigurations.nixrpi = mkNixos "aarch64-linux" [ ./systems/nixrpi.nix ];
      nixrpi = self.nixosConfigurations.nixrpi.config.system.build.toplevel;

      nixosConfigurations.nixvm = mkNixos "x86_64-linux" [ ./systems/nixvm.nix ];
      nixvm = self.nixosConfigurations.nixvm.config.system.build.toplevel;

      systemConfigs.archpc = mkSystem [ ./systems/archpc.nix ];
      archpc = self.systemConfigs.archpc.config.build.toplevel;

      # build usb with .#usb.<system>
      usb = (mkNixos "x86_64-linux" [ ./systems/usb.nix ]).config.system.build.isoImage;

      darwinPackages = self.darwinConfigurations.mbair.pkgs;

      devShell = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        with pkgs;
        mkShell {
          name = "config shell";
          buildInputs = [ neovim nixfmt ];
          # shellHook = '' ${git}/bin/git pull origin master '';
        }
      );


    };
}
