{
  description = "Ethan's NixOS, nix-darwin, and h-m system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/nur/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    easy-hls-nix = {
      url = "github:jkachmar/easy-hls-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #### PACKAGES ####
    st = {
      url = "gitlab:ethancedwards/st-config";
      flake = false;
    };
    dmenu = {
      url = "gitlab:ethancedwards/dmenu-config";
      flake = false;
    };
  };

  outputs = { self, darwin, nixpkgs, nur, home-manager, ...}@inputs:
    let
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;
      inherit (darwin.lib) darwinSystem;

      evalNixos = configuration: import "${inputs.nixpkgs}/nixos" {
        inherit configuration;
        system = "x86_64-linux";
      };

      supportedSystems = [ "x86_64-linux" "i686-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
    in {
      darwinConfigurations.mbair = darwinSystem (import ./systems/mbair.nix inputs);
      mbair = self.darwinConfigurations.mbair.config.system.build.toplevel;

      nixosConfigurations.nixlaptop = nixosSystem (import ./systems/nixlaptop.nix inputs);
      nixlaptop = self.nixosConfigurations.nixlaptop.config.system.build.toplevel;

      nixosConfigurations.nixpc = nixosSystem (import ./systems/nixpc.nix inputs);
      nixpc = self.nixosConfigurations.nixpc.config.system.build.toplevel;

      usb = (evalNixos (import ./systems/usb.nix inputs)).config.system.build.isoImage;

      overlays = {
        neovim = self.inputs.neovim-nightly.overlay;
        nur = self.inputs.nur.overlay;
        emacs = self.inputs.emacs-overlay.overlay;
      };

      darwinPackages = self.darwinConfigurations.mbair.pkgs;

      devShell = forAllSystems (system: nixpkgs.legacyPackages."${system}".callPackage ./packages/devShell.nix { });
      };
}
