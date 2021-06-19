inputs: {
  system = "x86_64-linux";

  modules = [
    ../modules/linux.nix
    ../hardware/nixlaptop.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.guix.nixosModules.guix
    ({ pkgs, config, ... }: {
      home-manager.users."ece" =
        { ... }: {
          imports = [ ../home-manager/modules/linux.nix ];

          home.packages = with pkgs; [
            (nur.repos.ethancedwards8.st.overrideAttrs (oldAttrs: rec {
              src = inputs.st;
            }))
            (nur.repos.ethancedwards8.dmenu.overrideAttrs (oldAttrs: rec {
              src = inputs.dmenu;
            }))
          ];

          ece = {
            pins = {
              inherit (inputs)
                nixpkgs
                nixpkgs-stable
                darwin

                home-manager
                nur;
            };
            config = {
              allowUnfree = true;
            };
            overlays = inputs.self.overlays;
          };
        };
      ece = {
        pins = {
          inherit (inputs)
            nixpkgs
            nixpkgs-stable
            darwin

            home-manager
            nur;
        };
        config = {
          allowUnfree = true;
        };
        overlays = inputs.self.overlays;

        podman.enable = true;
      };
      services.guix.enable = true;
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
      networking.hostName = "nixlaptop";
      system.stateVersion = "21.03";
      time.timeZone = "America/New_York";
    })
  ];
}
