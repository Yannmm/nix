{ pkgs, ... }:

{
  home.packages = [
    pkgs.claude-code
  ];

  home.file.".claude/settings.json".source =
    ../dotfiles/claude/settings.json;

  home.file.".claude/agents".source =
    ../dotfiles/claude/agents;

  # home.file.".claude/skills".source =
  #   ../dotfiles/claude/skills;
}