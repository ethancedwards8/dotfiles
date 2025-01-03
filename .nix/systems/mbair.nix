inputs: {
    system = "aarch64-darwin";

    modules = [
      ../modules/cachix.nix
      ({ pkgs, ... }: {
        services.nix-daemon.enable = true;
        programs.nix-index.enable = true;
        programs.nix-index.package = pkgs.nix-index;
        nix.channel.enable = false;
        nix.settings.trusted-users = [ "root" "ece" "@wheel" "@admin" ];
        nix.configureBuildUsers = true;
        nix.package = pkgs.nixVersions.latest;
        nix.extraOptions = 
        ''
          experimental-features = nix-command flakes ca-derivations
          builders-use-substitutes = true
          auto-optimise-store = true
          extra-platforms = aarch64-darwin
        '';


        # system.configurationRevision = self.rev or self.dirtyRev or null;

        users.users.ece = {
          home = "/Users/ece";
          description = "Ethan Carter Edwards";
          # shell = pkgs.bashInteractive;
        };

        environment.systemPackages =
          [ 
            # inputs.nixpkgs.pkgs.neovim
          ];

        homebrew = {
            enable = true;
            brews = [
                "neovim"
            ];
            casks = [
                "kitty"
                "emacs"
            ];
        };

        programs.gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };

        programs.bash.enable = true;

        system.stateVersion = 5;

        nixpkgs.hostPlatform = "aarch64-darwin";
      })
    ];
}
