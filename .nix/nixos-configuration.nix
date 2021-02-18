{ config, pkgs, lib, inputs, ... }:

{
  networking.hostName = "nixlaptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # nixpkgs.config.allowUnfree = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  # networking.interfaces.enp1s0.useDHCP = true;
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

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver = {
    enable = true;

    windowManager = {
      bspwm.enable = true;
      exwm.enable = true;
      awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };
    };

    desktopManager = {
      # plasma5.enable = true;
    };

    displayManager = {
      defaultSession = "none+bspwm";
      lightdm.enable = true;
    };

    libinput.enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
    };

    bluetooth.enable = true;
  };

  security.doas.enable = true;
  security.pam.services.ece.gnupg.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ece = {
    createHome = true;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "vboxusers" "docker" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.bashInteractive;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    cachix
    curl
    git
    unzip
    wget
    gnupg
    pinentry-curses
  ];

  # nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.package = pkgs.nixFlakes;
  nix.trustedUsers = [ "root" "ece" "@wheel" ];
  nix.extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes) 
  ''
    experimental-features = nix-command flakes
    auto-optimise-store = true
  '';

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [ jetbrains-mono emacs-all-the-icons-fonts ];
  };

  # virtualisation.docker = {
  #   enable = true;
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.pcscd.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];
  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services.gnome3.gnome-keyring.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.03"; # Did you read the comment?

}
