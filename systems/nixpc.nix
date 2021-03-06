inputs: {
  system = "x86_64-linux";

  modules = [
    ../modules/linux.nix
    ../modules/desktop.nix
    ../hardware/nixpc.nix
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

            nur.repos.ethancedwards8.sysfo

            # (inputs.veloren.defaultPackage."${system}")
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
              # contentAddressedByDefault = true;
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
          # contentAddressedByDefault = true;
        };
        overlays = inputs.self.overlays;

        podman.enable = true;
        xserver.enable = true;
      };
      # services.guix.enable = true;
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
      networking.hostName = "nixpc";
      system.stateVersion = "21.03";
      time.timeZone = "America/New_York";
    })
  ];
}
