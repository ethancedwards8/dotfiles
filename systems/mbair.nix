inputs: {
  system = "x86_64-darwin";

  modules = [
    ../modules/darwin.nix
    ../modules/default.nix
    inputs.home-manager.darwinModules.home-manager
    ({pkgs, config, ...}: {
      home-manager.users."ece" =
        { ... }: {
          imports = [ ../home-manager/modules/default.nix ];
        };
    })
  ];
}
