{ config, pkgs, lib, inputs, ... }:

{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  # time.timeZone = "America/New_York";

  nixpkgs.config.allowUnfree = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.interfaces.enp1s0.useDHCP = true;
  # networking.interfaces.wlp2s0.useDHCP = true;
  # networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Configure keymap in X11
  # services.xserver = {
  #   enable = true;

  #   layout = "us,es";
  #   xkbOptions = "grp:lalt_lshift_toggle";
  #   # xkbVariant = ",qwerty";

  #   windowManager = {
  #     bspwm.enable = true;
  #     exwm.enable = true;
  #     awesome = {
  #       enable = true;
  #       luaModules = with pkgs.luaPackages; [
  #         luarocks
  #         luadbi-mysql
  #       ];
  #     };
  #   };

  #   desktopManager = {
  #     # plasma5.enable = true;
  #   };

  #   displayManager = {
  #     defaultSession = "none+bspwm";
  #     lightdm.enable = true;
  #   };

  #   libinput = {
  #     enable = true;
  #     mouse.middleEmulation = true;
  #   };
  # };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware = {
  #   pulseaudio = {
  #     enable = true;
  #     package = pkgs.pulseaudioFull;
  #     support32Bit = true;
  #   };
  #   opengl.driSupport32Bit = true;

  #   # bluetooth.enable = true;
  # };

  # security.doas.enable = true;
  # security.pam.services.ece.gnupg.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.ece = {
  #   createHome = true;
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" "video" "audio" "networkmanager" "vboxusers" "docker" ];
  #   shell = pkgs.bashInteractive;
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   cachix
  #   curl
  #   git
  #   gnupg
  #   pinentry-curses
  #   unzip
  #   wget
  # ];

  # nix.registry.nixpkgs.flake = inputs.nixpkgs;
  # nix.package = pkgs.nixFlakes;
  # nix.trustedUsers = [ "root" "ece" "@wheel" ];
  # nix.autoOptimiseStore = true;
  # nix.extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
  # ''
  #   experimental-features = nix-command flakes ca-references
  #   builders-use-substitutes = true
  # '';
  # nix.distributedBuilds = true;
  # nix.buildMachines = [{
    # hostName = "builder-nixpc";
    # systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" ];
    # maxJobs = 3;
    # speedFactor = 2;
    # supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
    # mandatoryFeatures = [ ];
  # }# {
  #   hostName = "builder-fedora";
  #   systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" ];
  #   maxJobs = 3;
  #   speedFactor = 2;
  #   supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
  #   mandatoryFeatures = [ ];
  # }
                      # ];
  programs.ssh.startAgent = false;
  programs.ssh.extraConfig = ''
    Host builder-nixpc
         HostName 192.168.7.248
         Port 22
         User ece
         IdentitiesOnly yes
         IdentityFile /home/ece/.ssh/id_ed25519
    Host builder-fedora
         HostName 192.168.7.207
         Port 22
         User root
         IdentitiesOnly yes
         IdentityFile /home/ece/.ssh/id_rsa
    '';

  # fonts = {
  #   fontDir.enable = true;
  #   fonts = with pkgs; [ jetbrains-mono emacs-all-the-icons-fonts ];
  # };

  # virtualisation.docker = {
  #   enable = true;
  #   liveRestore = false;
  # };
  # virtualisation.podman = {
  #   enable = true;
  # };
  # virtualisation = {
  #   virtualbox = {
  #     host.enable = true;
  #     host.enableExtensionPack = true;
  #     host.package = pkgs.virtualboxWithExtpack;
  #   };
  # };

  # boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # services.pcscd.enable = true;
  # services.udev.packages = with pkgs; [ yubikey-personalization ];
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # services.trezord.enable = true;
  # services.gnome3.gnome-keyring.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 22 ];
  # # networking.firewall.allowedUDPPorts = [ ... ];
  # # Or disable the firewall altogether.
  # networking.firewall.enable = true;

  # networking.extraHosts = ''
  #   192.168.7.76 rpi1
  #   192.168.7.77 rpi2
  #   192.168.7.78 rpi3
  #   192.168.7.79 rpi4
  #   192.168.7.207 fedora
  #   192.168.7.247 nixlaptop
  #   192.168.7.248 nixpc
  # '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # system.stateVersion = "21.03"; # Did you read the comment?

}
