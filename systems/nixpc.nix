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

          ece = {
            pins = {
              inherit (inputs)
                nixpkgs
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
      networking.hostName = "nixpc";
      system.stateVersion = "21.03";
      time.timeZone = "America/New_York";
      nixpkgs.config.allowUnfree = true;
    })
  ];
}
