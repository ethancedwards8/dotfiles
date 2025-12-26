{ pkgs, config, lib, inputs, ... }:

let
  sshKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBztsVhWiH8yxAn87X1JpEfm22sLTNT63Bf1+3/r5oZR (none)"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHYzlQDqJqchPqQE4X5MIo08tMUgF0fxtmSyVqFUafdT openpgp:0x491BEF06"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/SmKDERq+PFwlYfAAgxbKicvgkN5XJRo5CfYn3dFUU0hUjDlRBdToxNtY8LWi5tzHTOXUjZdMMABodpQk1Z3KZMQJAn0LyCp+jF60EINStKZQHNB3orlNeDzSP+2RcCwJUuAYb8zBFS/NZBGY6VQYnWLBtAJf4xsyNxLnLL4nlSiijh/1uiI6i6VmxdOwHMku9JnRqwBS3JvsJ5idT2WkK/PJbvaFtthyTILoPMicfNKarPxlj+FalQT4L0GereZ4uDGSR+xtwLzTXu9EjckralTko0uyrEuFLII96i3x4Uv3kaYYgEPFef/B6HVoaeoyJc8k95+J4mWLlEIyY07jbQLlmnRybvDUVaTcerI4KYngLGVkwH3KaWZy3go5E+hT+VLWxZY1Nkj4/SnOi7UJBUxONMGDriGaLMD5ao4l5RJGrcGUJVeyj9RrpBwENK2isP59iPxGcTXgHNFuuuxGEHJT2QmalrTta9/Uh/UCj9JSEQ/LTMXGftMZY0GrDxs= ece@archlaptop"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVy5JBTvHOFYkkRRCPkNPI0WwimIAAG1wFjFFtuZlgt ethan@ethancedwards.com"
  ];
in
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

  services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
  };

  users.users.root.openssh.authorizedKeys.keys = sshKeys;
  users.users.ece.openssh.authorizedKeys.keys = sshKeys;

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

    inputs.system-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
