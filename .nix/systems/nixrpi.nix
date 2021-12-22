inputs: {
  system = "aarch64-linux";

  modules = [
    ../modules/linux.nix
    ../hardware/nixrpi.nix
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
    inputs.home-manager.nixosModules.home-manager
    ({ pkgs, config, ... }: {
      home-manager.users."ece" =
        { ... }: {
          imports = [ ../home-manager/modules/pin-nixpkgs.nix ../home-manager/modules/neovim.nix ];
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
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
      networking.hostName = "nixrpi";
      system.stateVersion = "21.05";
      time.timeZone = "America/New_York";
      networking = {
        usePredictableInterfaceNames = false;
        interfaces.eth0.ipv4.addresses = [{
          address = "192.168.7.80";
          prefixLength = 24;
        }];
        defaultGateway = "192.168.7.1";
        nameservers = [ "192.168.7.1" ];
      };

      virtualisation.docker = {
        enable = true;
        liveRestore = false;
      };
    })
  ];
}
