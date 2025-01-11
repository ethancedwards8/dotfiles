{ pkgs, config, lib, inputs, ... }:

{

  programs.direnv.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
  };

  services.openssh.enable = true;

  users.users.ece = {
      isNormalUser = true;
      initialPassword = "hunter2";
      createHome = true;
      home = "/home/ece";
      shell = pkgs.bashInteractive;
      extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" "libvirtd" "vboxusers" ];
  };

  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    cachix
    curl
    git
    gnupg
    nix-health
    nix-info
    nixfmt-rfc-style
    nixpkgs-review
    pinentry-tty
    wget
  ];
}
