{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.impermanence
    inputs.nixos-passthru-cache.nixosModules.nixos-passthru-cache

    ../hardware/nixvm.nix

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/linux.nix
    ../modules/guix.nix
  ];

  services.nixos-passthru-cache.enable = true;
  services.nixos-passthru-cache.forceSSL = false;
  services.nixos-passthru-cache.hostName = "cache.ethancedwards.com";

  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/NetworkManager/system-connections"
      "/var/log"
      "/var/lib/systemd/coredump"
      "/var/lib/nixos"
    ];
    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBztsVhWiH8yxAn87X1JpEfm22sLTNT63Bf1+3/r5oZR (none)"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHYzlQDqJqchPqQE4X5MIo08tMUgF0fxtmSyVqFUafdT openpgp:0x491BEF06"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/SmKDERq+PFwlYfAAgxbKicvgkN5XJRo5CfYn3dFUU0hUjDlRBdToxNtY8LWi5tzHTOXUjZdMMABodpQk1Z3KZMQJAn0LyCp+jF60EINStKZQHNB3orlNeDzSP+2RcCwJUuAYb8zBFS/NZBGY6VQYnWLBtAJf4xsyNxLnLL4nlSiijh/1uiI6i6VmxdOwHMku9JnRqwBS3JvsJ5idT2WkK/PJbvaFtthyTILoPMicfNKarPxlj+FalQT4L0GereZ4uDGSR+xtwLzTXu9EjckralTko0uyrEuFLII96i3x4Uv3kaYYgEPFef/B6HVoaeoyJc8k95+J4mWLlEIyY07jbQLlmnRybvDUVaTcerI4KYngLGVkwH3KaWZy3go5E+hT+VLWxZY1Nkj4/SnOi7UJBUxONMGDriGaLMD5ao4l5RJGrcGUJVeyj9RrpBwENK2isP59iPxGcTXgHNFuuuxGEHJT2QmalrTta9/Uh/UCj9JSEQ/LTMXGftMZY0GrDxs= ece@archlaptop"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVy5JBTvHOFYkkRRCPkNPI0WwimIAAG1wFjFFtuZlgt ethan@ethancedwards.com"
  ];


  networking.hostName = "nixvm";

  services.qemuGuest.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "24.11"; # Did you read the comment?
}
