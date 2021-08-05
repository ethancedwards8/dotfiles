{ pkgs, ... }:

{
  imports = [
    ./bspwm.nix
    ./cli.nix
    ./emacs.nix
    # ./firefox.nix
    ./games.nix
    ./gpg.nix
    # ./home-manager.nix
    ./languages-and-server.nix
    ./minecraft.nix
    ./neomutt.nix
    ./neovim.nix
    ./nix-du.nix
    ./polybar.nix
    ./pin-nixpkgs.nix
    ./terminals.nix
  ];

  services.emacs = {
    enable = true;
    package = pkgs.emacsGit;
    client.enable = true;
  };
  xdg.userDirs.enable = false;
  xdg.userDirs.desktop = "";

  home.packages = with pkgs; [
    anki-bin
    godot
    discord
    firefox
    gnome3.nautilus
    i3lock
    monero
    monero-gui
    mpv
    nextcloud-client
    nixos-shell
    picard
    picom
    qbittorrent
    qutebrowser
    scrot
    slock
    spotify
    sxiv
    trezor-suite
    xss-lock
    zathura
    virt-viewer
  ];
}
