inputs: {
    system = "aarch64-darwin";

    modules = [
      ../modules/cachix.nix
      ../modules/nix.nix
      ({ pkgs, self, lib, ... }: {
        # thank you @elvishjerricco:matrix.org!
        # map flake inputs to registry
        nix.registry = lib.mapAttrs (n: flake: { inherit flake; }) inputs;
        environment.etc = lib.mapAttrs' (name: flake: {
            name = "nix/inputs/${name}";
            value.source = flake.outPath;
            }) inputs;
        nix.nixPath = ["/etc/nix/inputs"];



        services.nix-daemon.enable = true;
        programs.nix-index.enable = true;
        programs.nix-index.package = pkgs.nix-index;

        security.pam.enableSudoTouchIdAuth = true;

        programs.direnv.enable = true;

        users.users.ece = {
          home = "/Users/ece";
          description = "Ethan Carter Edwards";
          shell = pkgs.bashInteractive;
        };

        environment.systemPackages =
          with pkgs; [
              nixfmt-rfc-style
              nixpkgs-review
              nix-info
          ];

        homebrew = {
            enable = true;
            onActivation.cleanup = "uninstall";
            brews = [
              "atomicparsley"
              "bash"
              "ca-certificates"
              "exiftool"
              "eza"
              "fzf"
              "gh"
              "git"
              "gnupg"
              "htop"
              "ispell"
              "jq"
              "mas"
              "neofetch"
              "neomutt"
              "neovim"
              "nmap"
              "pinentry"
              "ripgrep"
              "starship"
              "tmux"
              "wget"
              "yt-dlp"
              "podman"
            ];
            casks = [
                "element"
                "emacs"
                "firefox"
                "ghostty"
                "kdenlive"
                "kitty"
                "postman"
                "signal"
                "tailscale"
                "vlc"
            ];
            masApps = {
            };
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
