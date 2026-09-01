{ ... }:

{
  programs.tmux = {
    enable = true;

    mouse = true;
    keyMode = "vi";
    terminal = "screen-256color";

    extraConfig = ''
      set -g status-interval 1
      set -g history-limit 10000

      set -g set-clipboard on
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
    '';
  };
}
