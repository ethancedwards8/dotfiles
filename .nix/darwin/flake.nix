{
  description = "Ethan darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # darwin.url = "github:lnl7/nix-darwin/master";
    darwin.url = "github:ethancedwards8/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";

    # neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    # emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = { self, darwin, nixpkgs, nur }@inputs:
  let
    configuration = import ./darwin-configuration.nix;

    cachix = import ./cachix.nix;

    overlays = [
      # inputs.emacs-overlay.overlay
      # inputs.neovim-nightly.overlay
    ];
  in
  {
    darwinConfigurations."Ethans-MacBook-Air" = darwin.lib.darwinSystem {
      modules = [ cachix configuration darwin.darwinModules.simple {nixpkgs.overlays = [ nur.overlay ]; } ];
      inputs = inputs;
    };

    # expose the package set, including overlays, for convenience???
    darwinPackages = self.darwinConfigurations."Ethans-MacBook-Air".pkgs;
  };
}
