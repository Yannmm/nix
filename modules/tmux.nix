{ ... }:

{
  programs.tmux = {
    enable = true;

    mouse = false;
    keyMode = "vi";
    terminal = "screen-256color";

    extraConfig = ''
      unbind C-b
      set-option -g prefix C-q
      bind-key C-q send-prefix

      set -g status-interval 1
      set -g history-limit 10000
      set -g set-clipboard on
    '';
  };
}