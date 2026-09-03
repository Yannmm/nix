{ config, lib, pkgs, ... }:

let
  npmGlobalDir = "${config.home.homeDirectory}/.npm-global";
in
{
  home.packages = [
    pkgs.nodejs
  ];

  home.sessionPath = [
    "${npmGlobalDir}/bin"
  ];

  home.file.".npmrc".text = ''
    prefix=${npmGlobalDir}
  '';

  home.activation.createNpmGlobalDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "${npmGlobalDir}/lib/node_modules"
  '';
}