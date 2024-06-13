{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell rec {
  buildInputs = with pkgs; [ glib nss nspr ];

  shellHook = "";
  LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath buildInputs}";
}
