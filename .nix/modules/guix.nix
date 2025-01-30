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
          sha256 = "0j66nq1bxvbxf5n8q2py14sjbkn57my0mjwq7k1qm9ddghca7177";
        })

        (builtins.fetchurl {
          url = "https://guix.bordeaux.inria.fr/signing-key.pub";
          sha256 = "056cv0vlqyacyhbmwr5651fzg1icyxbw61nkap7sd4j2x8qj7ila";
        })
      ];
  };
}
