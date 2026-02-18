{ config, pkgs, ... }:

let
  motdScript = ''
    clear
    if command -v fastfetch &> /dev/null; then
      sleep 0.1 && fastfetch
    fi
  '';
in
{
  programs.readline = {
    enable = true;
    extraConfig = ''
      set editing-mode vi
      $if mode=vi
        set keymap vi-command
        Control-l: clear-screen
        set keymap vi-insert
        Control-l: clear-screen
      $endif
    '';
  };

  home.sessionVariables = {
    # Editor & Terminal
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "alacritty";
    TERM = "xterm-256color";

    # History
    HISTCONTROL = "ignorespace";

    # Go
    GOPATH = "$HOME/go";

    # Ansible
    ANSIBLE_NOCOWS = "1";

    # Mac Colors (Keep these even on Linux, they are harmless)
    CLICOLOR = "1";
    LSCOLORS = "ExFxBxDxCxegedabagacad";
  };

  home.sessionPath = [
    "$HOME/go/bin"
    "$HOME/.local/bin"
  ];

  home.shellAliases = {
    # Convenience
    ll = "ls -la";

    # Git
    lg = "lazygit";
    gst = "git status";
    ga = "git add";
    gaa = "git add .";
    gc = "git commit";
    gcm = "git commit -m";
    gco = "git checkout";

    # Productivity
    devnotes = "cd $HOME/dev-notes && nvim README.md";
    worklog = "gh gist edit 92f0423ccade1927b6490ec98d36990c";
    journal = "gh gist edit d78e04055dcdcf9caba2e26eb4a47bb5";
    tss = "date '+%F'";
    tsm = "date '+%F %a'";
    tsl = "date '+%F %a %H:%M:%S'";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    # Custom prompt & Local Config
    bashrcExtra = ''
      export PS1="\[\e[1m\w\]\n\$ \[\e[0m\]"

      if [ -f "$HOME/.local-config" ]; then
        source "$HOME/.local-config"
      fi

      ${motdScript}
    '';
  };

  # 6. ZSH CONFIGURATION
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      # VIM MODE & CTRL-R fix
      bindkey -v
      bindkey '^r' history-incremental-search-backward

      # PROMPT
      PROMPT="%B%~%b"$'\n'"%# "

      if [ -f "$HOME/.local-config" ]; then
        source "$HOME/.local-config"
      fi

      ${motdScript}
    '';

    # Fix for compinit security warnings on macOS
    completionInit = "autoload -U compinit && compinit -u";
  };
}
