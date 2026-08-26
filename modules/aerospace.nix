{ config, lib, pkgs, ... }:

{
  home.file.".config/aerospace/aerospace.toml".source = lib.mkForce ./aerospace.toml;

  programs.aerospace = {
    enable = true;
    launchd.enable = true;
  };
}
