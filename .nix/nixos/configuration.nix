# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # for luks encryption
  # boot.initrd.luks.devices = [
  #   {
  #     name = "root"; device = "/dev/sda2"; preLVM = true;
  #   }
  # ];
  boot.initrd.luks.devices = {
      root = {
        device = "/dev/sda2";
        preLVM = true; 
      };
  };

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixlaptop"; # Define your hostname.

  networking.extraHosts = ''
    192.168.1.11  roxanne
    192.168.7.76  rpi1
    192.168.7.77  rpi2
    192.168.7.78  rpi3
    192.168.7.79  rpi4
    192.168.7.207 fedora
  '';

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    wget
    bspwm
    polybar
    sxhkd
    nitrogen
  ];

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    jetbrains-mono
    dina-font
    proggyfonts
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # start emacs service
  services.emacs.enable = true;
  services.emacs.install = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  security.wrappers.slock.source = "${pkgs.slock.out}/bin/slock";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;
  services.xserver.libinput.middleEmulation = true;
  # services.xserver.libinput.scrollButton = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  # services.xserver.windowManager.bspwm.sxhkd.configFile = "${pkgs.bspwm}/share/doc/bspwm/examples/sxhkdrc";
  # services.xserver.windowManager.bspwm.sxhkd.configFile = "${pkgs.bspwm}/share/doc/bspwm/examples/sxhkdrc";
  services.xserver.autorun = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ece = {
    createHome = true;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" ];
    group = "users";
    home = "/home/ece";
    description = "Ethan Carter Edwards";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}
