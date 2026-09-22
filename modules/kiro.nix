{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kiro-cli
  ];

  # Kiro CLI shell integration — only active on hosts that import this module.
  programs.zsh.initContent = ''
    # Kiro CLI
    eval "$(kiro-cli init zsh pre)"
    eval "$(kiro-cli init zsh post)"
  '';

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
