{
  home.packages = [
    pkgs.opencode
  ];

  xdg.configFile."opencode/AGENTS.md".source =
    ../dotfiles/opencode/AGENTS.md;

  xdg.configFile."opencode/opencode.json".source =
    ../dotfiles/opencode/opencode.json;

  xdg.configFile."opencode/agents".source =
    ../dotfiles/opencode/agents;
}