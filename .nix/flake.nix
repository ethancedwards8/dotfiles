{
  description = "Ethan's Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nur }:
    let
      inherit (nix-darwin.lib) darwinSystem;

      lib = nixpkgs.lib;

      forAllSystems = lib.genAttrs lib.systems.flakeExposed;

    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#mbair
      darwinConfigurations."mbair" = darwinSystem (import ./systems/mbair.nix inputs);
      mbair = self.darwinConfigurations.mbair.config.system.build.toplevel;

      darwinPackages = self.darwinConfigurations.mbair.pkgs;

      devShell = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        with pkgs; mkShell {
          name = "config shell";
          buildInputs = [ nixfmt-rfc-style git ] ++ pkgs.lib.optionals (pkgs.stdenv.isx86_64 && pkgs.stdenv.isLinux) [ brave /* I want it in my store, but not in my env */ ];
          # shellHook = '' ${git}/bin/git pull origin master '';
        }
      );
    };
}
