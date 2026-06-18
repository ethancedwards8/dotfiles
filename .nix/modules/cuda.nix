{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    nvidia.open = true;
  };

  environment.systemPackages = with pkgs; [
    pciutils
    btop
    nvtopPackages.nvidia
  ];


}
