{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;

      theme = "ys";

      plugins = [
        "git"
        "z"
        "macos"
      ];
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
      }
      {
        name = "zsh-history-substring-search";
        src = "${pkgs.zsh-history-substring-search}/share/zsh/plugins/zsh-history-substring-search";
      }
    ];

    shellAliases = {
      proxy = "export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890";
      deproxy = "unset https_proxy http_proxy all_proxy";

      git_branch_trimmer = "git branch | fzf -m | xargs git branch -D";
    };

    profileExtra = ''
      source ~/.orbstack/shell/init.zsh 2>/dev/null || :
    '';

    initContent = ''
      # Gemini CLI
      export GOOGLE_CLOUD_PROJECT="gen-lang-client-0567175526"
    '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
