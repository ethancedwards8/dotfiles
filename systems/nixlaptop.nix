inputs: {
  system = "x86_64-linux";

  modules = [
    ../modules/linux.nix
    ../hardware/nixlaptop.nix
    inputs.home-manager.nixosModules.home-manager
    ({ pkgs, config, ... }: {
      home-manager.users."ece" =
        { ... }: {
          imports = [ ../home-manager/modules/linux.nix ];
        };
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
      networking.hostName = "nixlaptop";
      system.stateVersion = "21.03";
      time.timeZone = "America/New_York";
      nixpkgs.config.allowUnfree = true;
    })
  ];
}
