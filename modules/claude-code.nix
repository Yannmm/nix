{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.claude-code
  ];

  home.file.".claude/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.config/nix/dotfiles/claude/settings.json";

  home.file.".claude/agents".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.config/nix/dotfiles/claude/agents";

  # home.file.".claude/skills".source =
  #   ../dotfiles/claude/skills;
}