{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-marketplace; [
      anthropic.claude-code
      bbenoist.nix
      codemos.codemos-modern
      dart-code.dart-code
      dart-code.flutter
      kaiqun.build-runner
      localizely.flutter-intl
      mk12.better-git-line-blame
      ms-ossdata.vscode-pgsql
      oderwat.indent-rainbow
      pejmannikram.vscode-auto-scroll
      ms-vscode-remote.remote-containers
      amazonwebservices.amazon-q-vscode
    ];
  };

  home.file."Library/Application Support/Code/User/settings.json".source =
    lib.mkForce (
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.config/nix/dotfiles/vscode-user-settings.json"
    );
}