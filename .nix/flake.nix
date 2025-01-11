{
  description = "Ethan's Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, }:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;

      mkDarwin = system: modules: nix-darwin.lib.darwinSystem {
          inherit system modules;
          specialArgs = { inherit inputs outputs self; };
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#mbair
      darwinConfigurations."mbair" = mkDarwin "aarch64-darwin" [ ./systems/mbair.nix ];
      mbair = self.darwinConfigurations.mbair.config.system.build.toplevel;

      darwinPackages = self.darwinConfigurations.mbair.pkgs;

      devShell = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        with pkgs;
        mkShell {
          name = "config shell";
          buildInputs = [ nixfmt-rfc-style git ];
          # shellHook = '' ${git}/bin/git pull origin master '';
        }
      );


    };
}
