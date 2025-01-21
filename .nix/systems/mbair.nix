{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/common.nix
  ];

  nix.configureBuildUsers = true;
  programs.nix-index.enable = true;
  services.nix-daemon.enable = true;

  nix.buildMachines = [
    {
      hostName = "nixvm";
      systems = [ "x86_64-linux" "aarch64-linux" "i686-linux" "riscv64-linux" ];
      maxJobs = 3;
	  speedFactor = 2;
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
	  mandatoryFeatures = [ ];
    }
  ];
  nix.distributedBuilds = true;

  security.pam.enableSudoTouchIdAuth = true;

  users.users.ece = {
    home = "/Users/ece";
    description = "Ethan Carter Edwards";
    shell = pkgs.bashInteractive;
  };

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
      "git-lfs"
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

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  programs.bash.enable = true;

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
