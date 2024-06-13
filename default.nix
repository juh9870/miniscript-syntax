{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "vscode-extension-miniscript-syntax";
  vscodeExtUniqueId = "miniscript-syntax";
  vscodeExtPublisher = "juh9870";
  version = "0.0.3";

  buildInputs = with pkgs; [
    bash
    nodejs_18
    nodePackages.pnpm
    vsce
  ];

  src=./.;

  buildPhase = ''
    pnpm i --frozen-lockfile
    # vsce package --no-dependencies
  '';

  installPrefix = "share/vscode/extensions/miniscript-syntax";
  installPhase = ''
      mkdir -p "$out/$installPrefix"
      find . -mindepth 1 -maxdepth 1 | xargs -d'\n' mv -t "$out/$installPrefix/"
  '';
}
