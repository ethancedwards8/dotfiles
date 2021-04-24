inputs: {
  # system = "x86_64-darwin";

  modules = [
    ../modules/darwin.nix
    # ../modules/default.nix
    inputs.darwin.darwinModules.simple
    inputs.home-manager.darwinModules.home-manager
    ({pkgs, config, ...}: {
      home-manager.users."ece" =
        { ... }: {
          imports = [ ../home-manager/modules/darwin.nix ];
        };
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
      nixpkgs.config.allowUnfree = true;
    })
  ];
}
