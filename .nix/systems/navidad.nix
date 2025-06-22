{ pkgs, self, lib, inputs, ... }:

{
  imports = [
    ../hardware/navidad.nix

    ../modules/cachix.nix
    ../modules/nix.nix
    ../modules/linux.nix
    ../modules/guix.nix
    ../modules/xserver.nix
  ];

  ### for Hidpi stuff on framework
  # bigger tty fonts
  # console.font =
  #   "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  services.xserver.dpi = 180;
  environment.variables = {
    ## Used by GTK 3
    # `GDK_SCALE` is limited to integer values
    GDK_SCALE = "2";
    # Inverse of GDK_SCALE
    GDK_DPI_SCALE = "0.5";

    # Used by Qt 5
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";

    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };
  # Expose variables to graphical systemd user services
  services.xserver.displayManager.importedVariables = [
    "GDK_SCALE"
    "GDK_DPI_SCALE"
    "QT_AUTO_SCREEN_SCALE_FACTOR"
  ];

  services.tailscale.enable = true;

  networking.hostName = "navidad";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "25.11"; # Did you read the comment?
}
