{ pkgs, config, lib, inputs, ... }:

{
  services.guix = {
    enable = true;
    gc.enable = true;
    substituters.urls = 
      options.services.guix.substituters.urls.default ++ [
        "https://substitutes.nonguix.org/"
    ];
  };
}
