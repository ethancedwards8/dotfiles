{ pkgs, lib, config, inputs, self, ... }:

{
  environment.etc."k3s-resolv.conf".text = ''
    nameserver 10.0.20.2
    options edns0
  '';

  networking.firewall.enable = false;

  services.k3s = {
    enable = true;
    clusterInit = true;
    extraFlags = [
      "--disable=traefik"
      "--flannel-backend=none"
      "--disable-network-policy"
      "--disable-kube-proxy"
      "--disable servicelb"
      "--kubelet-arg=resolv-conf=/etc/k3s-resolv.conf" 
    ];
  };
}
