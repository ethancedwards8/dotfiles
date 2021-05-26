inputs: {
  system = "x86_64-linux";

  modules = [
    ../modules/linux.nix
    ../modules/desktop.nix
    ../hardware/nixpc.nix
    inputs.home-manager.nixosModules.home-manager
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

            (inputs.easy-hls-nix.defaultPackage."${system}")
            (inputs.nix-eval-lsp.defaultPackage."${system}")
            (inputs.veloren.defaultPackage."${system}")
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
      };
      environment.shellAliases = {
        nix-repl = "nix repl ${inputs.utils.lib.repl}";
      };
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
      networking.hostName = "nixpc";
      system.stateVersion = "21.03";
      time.timeZone = "America/New_York";
    })
  ];
}
