{ config, lib, pkgs, ... }:

let
  nm-enable = config.networking.networkmanager.enable;
  docker-enable = config.virtualisation.docker.enable;
  vbox-enable = config.virtualisation.virtualbox.host.enable;
in {
  users = {
    # mutableUsers = false;

    users.ece = {
      isNormalUser = true;
      createHome = true;
      home = "/home/ece";
      shell = pkgs.bashInteractive;
      # extraGroups = with lib; [ "wheel" "video" "audio" ]
      #               ++ (optional nm-enable "networkmanager")
      #               ++ (optional docker-enable "docker")
      #               ++ (optional vbox-enable "vboxusers");
      extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" "libvirtd" "vboxusers" ];
    };
  };
}
