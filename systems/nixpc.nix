inputs: {
  system = "x86_64-linux";

  modules = [
    ../hardware/nixpc.nix
    ../modules/default.nix
    inputs.home-manager.nixosModules.home-manager
    ({ pkgs, config, ... }: {
      home-manager.users."ece" =
        { ... }: {
          imports = [ ../home-manager/modules/default.nix ];
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
