{ pkgs, options, config, lib, inputs, ... }:

{
  services.guix = {
    enable = true;
    gc.enable = true;
    substituters.urls = 
      options.services.guix.substituters.urls.default ++ [
        "https://substitutes.nonguix.org/"
        "https://guix.bordeaux.inria.fr/"
      ];
    substituters.authorizedKeys =
      options.services.guix.substituters.authorizedKeys.default ++ [
        (builtins.fetchurl {
          url = "https://substitutes.nonguix.org/signing-key.pub";
          hash = "";
        })

        (builtins.fetchurl {
          url = "https://guix.bordeaux.inria.fr/signing-key.pub";
          hash = "";
        })
      ];
  };
}
