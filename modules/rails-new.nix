
{ pkgs, ... }:

{
  home.packages = [
    (pkgs.callPackage ../packages/rails-new.nix {})
  ];
}
