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

  
  programs.nix-required-mounts = {
    enable = true;
    presets.nvidia-gpu.enable = true;
  };

  nix.settings.system-features = [ "cuda" ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    # OLD consumers need to set - see nixvm gtx 970
    # hardware.nvidia.open = lib.mkForce false;
    nvidia.open = true;
  };

  environment.systemPackages = with pkgs; [
    pciutils
    nvtopPackages.nvidia
    btop-cuda
    cudaPackages.nvbandwidth
    cudaPackages.cuda_cuobjdump
    cudaPackages.cuda_nvdisasm
  ];
}
