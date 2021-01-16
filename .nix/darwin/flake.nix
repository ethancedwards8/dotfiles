{
  description = "Ethan darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # darwin.url = "github:lnl7/nix-darwin/master";
    darwin.url = "github:ethancedwards8/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    # emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = { self, darwin, nixpkgs }@inputs:
  # outputs = { self }@inputs:
  let
    configuration = import ./darwin-configuration.nix;

    overlays = [
      inputs.emacs-overlay.overlay
      inputs.neovim-nightly.overlay
    ];
  in
  {
    darwinConfigurations."Ethans-MacBook-Air" = darwin.lib.darwinSystem {
      modules = [ configuration darwin.darwinModules.simple ];
    };

    # expose the package set, including overlays, for convenience???
    darwinPackages = self.darwinConfigurations."Ethans-MacBook-Air".pkgs;
  };


}
