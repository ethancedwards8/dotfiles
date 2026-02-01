{ pkgs, config, lib, inputs, ... }:

{
  imports = [
    ./common.nix
  ];

  programs.bash = {
    enable = true;
    completion.enable = true;
  };

  # macos system settings
  system.defaults.NSGlobalDomain.AppleICUForce24HourTime = true;
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true;

  # control center
  system.defaults.controlcenter.BatteryShowPercentage = false;

  # dock
  system.defaults.dock.autohide = true;
  system.defaults.dock.showhidden = true;
  system.defaults.dock.show-recents = false;

  # finder
  system.defaults.finder.AppleShowAllFiles = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.FXRemoveOldTrashItems = true;
  system.defaults.finder.ShowStatusBar = true;
  system.defaults.finder._FXShowPosixPathInTitle = true;
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder.ShowMountedServersOnDesktop = true;


}
