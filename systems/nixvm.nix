inputs: {
  system = "x86_64-linux";

  modules = [
    ../modules/server.nix
    ../hardware/nixvm.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.impermanence.nixosModules.impermanence
    ({ pkgs, config, ... }: {
      home-manager.users."ece" =
        { ... }: {
          imports = [ ../home-manager/modules/linux.nix ];

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
          # contentAddressedByDefault = true;
        };
        overlays = inputs.self.overlays;
      };
      environment.persistence."/nix/persist" = {
        directories = [
          "/etc/NetworkManager/system-connections"
          "/var/log"
          "/var/lib/systemd/coredump"
        ];
        files = [
          "/etc/machine-id"
          "/etc/ssh/ssh_host_ed25519_key"
          "/etc/ssh/ssh_host_ed25519_key.pub"
          "/etc/ssh/ssh_host_rsa_key"
          "/etc/ssh/ssh_host_rsa_key.pub"
        ];
      };
      services.qemuGuest.enable = true;
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
      networking.hostName = "nixvm";
      system.stateVersion = "21.05";
      time.timeZone = "America/New_York";
      networking.hostId = "6ffc53da";
      users.users.ece.initialPassword = "hunter2";

      services.postgresql.enable = true;
      services.hydra = {
        enable = true;
        port = 3000;
        listenHost = "*";
        hydraURL = "http://localhost:3000";
        notificationSender = "hydra@ethancedwards.com";
        buildMachinesFiles = [];
        useSubstitutes = true;
      };
    })
  ];
}

