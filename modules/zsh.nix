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
        "nix-zsh-completions"
      ];
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
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

      # Nix shell prompt
      prompt_nix_shell_setup
    '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
