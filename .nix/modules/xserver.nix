{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

{
  services.xserver = {
    enable = true;

    xkb.layout = "us";

    windowManager = {
      bspwm.enable = true;
    };

    displayManager.lightdm.enable = true;
    displayManager.lightdm.background = pkgs.fetchurl {
      url = "https://gitlab.com/ethancedwards/wallpaper/-/raw/d20d16f1a2fa2b4c034be6e8c6c28bc0dad87460/free-software-gnu-meditate.png";
      hash = "sha256-2BAtuqNCviC92/UxRwni8uCu4g+MLJkW9KINagrIAoQ=";
    };
  };

  services.displayManager = {
    defaultSession = "none+bspwm";
  };

  services.libinput = {
    enable = true;
    mouse.middleEmulation = true;
  };

  programs.i3lock.enable = true;

  environment.systemPackages = with pkgs; [
    arandr
    dmenu
    kitty
    nautilus
    firefox
    polybarFull
    nitrogen
    sxiv
    mpv
    i3lock
    acpilight
    # xbacklight
    xclip
    xss-lock
    zathura
    zotero
    signal-desktop
    scrot

    (with inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}; anki.withAddons (with ankiAddons; [
      review-heatmap
      passfail2
      anki-quizlet-importer-extended
    ]))

    inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.zathura
  ];
}
