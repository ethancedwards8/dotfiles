inputs: {
  system = "x86_64-linux";

  modules = [
    ../modules/linux.nix
    ../hardware/nixpc.nix
    inputs.home-manager.nixosModules.home-manager
    ({ pkgs, config, ... }: {
      home-manager.users."ece" =
        { ... }: {
          imports = [ ../home-manager/modules/linux.nix ];
          services.emacs = {
            enable = true;
            client.enable = true;
          };
          xdg.userDirs.enable = false;
          xdg.userDirs.desktop = "";
          services.gpg-agent.enable = true;
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
