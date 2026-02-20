{ config, pkgs, ... }:

let
  # Dynamically choose the clipboard command based on the OS
  copyCommand = if pkgs.stdenv.isDarwin then "pbcopy" else "${pkgs.xclip}/bin/xclip -in -selection clipboard";
in
{
  programs.tmux = {
    enable = true;

    terminal = "screen-256color";
    escapeTime = 0;
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    aggressiveResize = true;

    extraConfig = ''
      # TRUE COLOR SUPPORT
      set -ga terminal-overrides ",xterm-256color*:Tc"

      # MISC SETTINGS
      set -g bell-action none
      setw -g xterm-keys on

      # VIM STYLE COPY AND PASTE
      bind Escape copy-mode
      bind p paste-buffer
      bind -T copy-mode-vi v send -X begin-selection

      # Notice how we inject the dynamic copyCommand variable here:
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "${copyCommand}"
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "${copyCommand}"
      bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "${copyCommand}"

      # STATUS BAR
      set -g status-position top
      set -g status-bg black
      set -g status-fg white
      set -g status-interval 1
      set -g status-right-length 120
      set -g status-right '#(date +"%b %_d %H:%M") | #(whoami)@#(hostname -s) '

      # SSH WARNING
      if-shell 'test "$SSH_CONNECTION"' 'set -g status-bg red'
    '';
  };

  # Ensure xclip is installed on Linux systems for the clipboard to work
  home.packages = pkgs.lib.mkIf pkgs.stdenv.isLinux [
    pkgs.xclip
  ];
}
