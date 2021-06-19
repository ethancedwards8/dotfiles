inputs: {
  # system = "x86_64-darwin";

  modules = [
    ../modules/darwin.nix
    inputs.home-manager.darwinModules.home-manager
    ({pkgs, config, ...}: {
      home-manager.users."ece" =
        { ... }: {
          imports = [ ../home-manager/modules/darwin.nix ];

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
      };
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
    })
  ];
}
