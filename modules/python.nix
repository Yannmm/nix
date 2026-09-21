{ pkgs, ... }:

let
  python = pkgs.python3.withPackages (ps: [
    ps.pip
  ]);
in
{
  home.packages = [
    python
  ];

  home.shellAliases = {
    python = "python3";
  };
}