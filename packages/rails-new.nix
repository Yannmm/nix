
{
  stdenvNoCC,
  fetchurl,
  lib,
}:

let
  version = "0.5.0";
in
stdenvNoCC.mkDerivation {
  pname = "rails-new";
  inherit version;

  src = fetchurl {
    url = "https://github.com/rails/rails-new/releases/download/v${version}/rails-new-aarch64-apple-darwin.tar.gz";

    # Temporary placeholder. Replace with the actual hash.
    hash = "sha256-//o8GL1p3Pwq59Me0WBrDHyujA170mx2Qc6phm7dhos=";
  };

  sourceRoot = ".";

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install -m755 rails-new $out/bin/rails-new

    runHook postInstall
  '';

  meta = {
    description = "Create Rails applications without Ruby installed locally";
    homepage = "https://github.com/rails/rails-new";
    license = lib.licenses.mit;
    platforms = [ "aarch64-darwin" ];
    mainProgram = "rails-new";
  };
}
