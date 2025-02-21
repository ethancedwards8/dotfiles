{ pkgs, config, lib, inputs, ... }:

{
  imports = [
    ./common.nix
  ];

  system.autoUpgrade.enable = true;
  system.autoUpgrade.flake = "github:ethancedwards8/dotfiles?dir=.nix#${config.networking.hostName}";

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
    curl
    git
    tmux
    gnupg
    pinentry-tty
    wget
  ];
}
