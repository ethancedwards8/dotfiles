{
  config,
  pkgs,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    ../hardware/work-devbox.nix

    ../modules/linux.nix
  ];

  environment.variables.AWS_DEFAULT_REGION = "us-west-2";

  networking.hostName = "work-devbox";
  networking.firewall.allowedTCPPorts = [ 2222 ];

  services.openssh = {
    enable = true;
    ports = [ 2222 ];
    openFirewall = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      ClientAliveInterval = 60;
      ClientAliveCountMax = 10;
    };
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJZJGqTB5jpzikP1qsmIQnSzGdxqmQNGmoR5ezoT+qp0 ece@Ethans-MacBook-Pro.local"
  ];

  users.users.ece = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJZJGqTB5jpzikP1qsmIQnSzGdxqmQNGmoR5ezoT+qp0 ece@Ethans-MacBook-Pro.local"
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    awscli2
    cachix
    curl
    direnv
    git
    git-lfs
    htop
    jq
    nix-direnv
    parted
    ripgrep
    rsync
    tmux
    neovim
    starship
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 14d";
    };
  };

  system.stateVersion = "26.05";
}
