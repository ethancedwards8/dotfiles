inputs: {
  system = "x86_64-linux";

  modules = [
    ../hardware/nixlaptop.nix
    ({ pkgs, config, ... }: {
      networking.hostName = "nixlaptop";
      system.stateVersion = "21.03";
      time.timeZone = "America/New_York";
    })
  ];
}
