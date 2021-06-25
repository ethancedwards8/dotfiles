{
  description = "Ethan's NixOS, nix-darwin, and h-m system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-21.05";

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

    # veloren = {
    #   url = "gitlab:veloren/veloren/43593bc4c90172b06f5dc709ff96d960995d9fa4";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # piston-cli = {
    #   url = "github:piston-cli/piston-cli";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    guix.url = "github:ethancedwards8/nixos-guix";

    #### NON FLAKE NIX PACKAGES ####

    #### NON NIX PACKAGES ####
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

      nixosConfigurations.nixvm = nixosSystem (import ./systems/nixvm.nix inputs);
      nixvm = self.nixosConfigurations.nixvm.config.system.build.toplevel;

      usb = (evalNixos (import ./systems/usb.nix inputs)).config.system.build.isoImage;

      overlays = {
        neovim = self.inputs.neovim-nightly.overlay;
        nur = self.inputs.nur.overlay;
        emacs = self.inputs.emacs-overlay.overlay;
        # piston-cli = self.inputs.piston-cli.overlay;
        guix = self.inputs.guix.overlay;
      };

      darwinPackages = self.darwinConfigurations.mbair.pkgs;

      devShell = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
          with pkgs; mkShell {
            name = "system-and-home-pull-on-entry";
            buildInputs = [ nixpkgs-fmt git ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ brave /* I want it in my store, but not in my env */ ];
            shellHook = '' ${git}/bin/git pull origin master '';
          }
      );
    };
}
