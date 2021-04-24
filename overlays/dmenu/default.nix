inputs:
final: prev:
with pkgs;
let
  lib = inputs.lib;
in
{
  ece = prev.ece or {} // {
    dmenu = prev.callPackage rec {
      src = inputs.dmenu;

      buildInputs = [ libX11 libXinerama zlib libXft ];

      inherit patches;
      
      postPatch = ''
        sed -ri -e 's!\<(dmenu|dmenu_path|stest)\>!'"$out/bin"'/&!g' dmenu_run
        sed -ri -e 's!\<stest\>!'"$out/bin"'/&!g' dmenu_path
      '';

      preConfigure = ''
        sed -i "s@PREFIX = /usr/local@PREFIX = $out@g" config.mk
      '';

      makeFlags = [ "CC:=$(CC)" ];

      meta = with lib; {
        description = "A generic, highly customizable, and efficient menu for the X Window System";
        homepage = "https://tools.suckless.org/dmenu";
        license = licenses.mit;
        maintainers = with maintainers; [ pSub globin ];
        platforms = platforms.all;
      };
    };
  };
}