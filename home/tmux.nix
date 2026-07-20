{ pkgs, ... }:

let
  # Dynamically choose the clipboard command based on the OS
  copyCommand = if pkgs.stdenv.isDarwin then "pbcopy" else "${pkgs.xclip}/bin/xclip -in -selection clipboard";
in
{
  programs.tmux = {
    enable = true;

    terminal = "tmux-256color";
    escapeTime = 10;
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    aggressiveResize = true;

    plugins = with pkgs.tmuxPlugins; [
      resurrect
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
        '';
      }
    ];

    extraConfig = ''
      # PREFIX KEYS
      set -g prefix C-Space
      set -g prefix2 C-b
      unbind C-b
      bind C-Space send-prefix

      # HELP + RELOAD
      bind q source-file ~/.config/tmux/tmux.conf \; display-message "tmux config reloaded"

      # COPY MODE (VI)
      setw -g mode-keys vi
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "${copyCommand}"
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "${copyCommand}"
      bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "${copyCommand}"

      # PANE MANAGEMENT
      bind -n M-Enter split-window -v -c "#{pane_current_path}"
      bind -n M-S-Enter split-window -h -c "#{pane_current_path}"
      bind -n M-Escape kill-pane

      bind h split-window -v -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"
      bind x kill-pane

      bind -n C-M-Left select-pane -L
      bind -n C-M-Right select-pane -R
      bind -n C-M-Up select-pane -U
      bind -n C-M-Down select-pane -D

      bind -n C-M-S-Left resize-pane -L 5
      bind -n C-M-S-Down resize-pane -D 5
      bind -n C-M-S-Up resize-pane -U 5
      bind -n C-M-S-Right resize-pane -R 5

      # WINDOW MANAGEMENT
      bind r command-prompt -I "#W" "rename-window -- '%%'"
      bind c new-window -c "#{pane_current_path}"
      bind k kill-window

      bind -n M-1 select-window -t :=1
      bind -n M-2 select-window -t :=2
      bind -n M-3 select-window -t :=3
      bind -n M-4 select-window -t :=4
      bind -n M-5 select-window -t :=5
      bind -n M-6 select-window -t :=6
      bind -n M-7 select-window -t :=7
      bind -n M-8 select-window -t :=8
      bind -n M-9 select-window -t :=9

      bind -n M-Left previous-window
      bind -n M-Right next-window
      bind -n M-S-Left swap-window -t -1 \; select-window -t -1
      bind -n M-S-Right swap-window -t +1 \; select-window -t +1

      # SESSION MANAGEMENT
      bind R command-prompt -I "#S" "rename-session -- '%%'"
      bind C new-session -c "#{pane_current_path}"
      bind K kill-session
      bind P switch-client -p
      bind N switch-client -n

      bind -n M-Up switch-client -p
      bind -n M-Down switch-client -n

      # GENERAL SETTINGS
      set -ga terminal-overrides ",*:RGB"
      set -g mouse on
      set -g base-index 1
      setw -g pane-base-index 1
      set -g renumber-windows on
      set -g focus-events on
      set -g set-clipboard on
      set -g allow-passthrough on
      set -g extended-keys on
      set -g extended-keys-format csi-u
      set -g escape-time 10
      set -g aggressive-resize on
      set -g detach-on-destroy off
      setw -g automatic-rename on
      setw -g automatic-rename-format "#{b:pane_current_path}"

      # STATUS BAR + THEME
      set -g status-position top
      set -g status-interval 5
      set -g status-left-length 30
      set -g status-right-length 50

      set -g status-style "bg=black,fg=white"
      set -g status-left "#[bold,fg=white,bg=black] #S #[default]"
      set -g status-right "#{?pane_in_mode,#[bold,fg=white]COPY #[default],}#{?client_prefix,#[bold,fg=white]PREFIX #[default],}#{?window_zoomed_flag,#[bold,fg=white]ZOOM #[default],}"
      setw -g window-status-format "#[fg=brightblack]#I:#W#[default]"
      setw -g window-status-current-format "#[bold,fg=white]#I:#W#[default]"
      set -g pane-border-style "fg=brightblack"
      set -g pane-active-border-style "fg=white"
    '';
  };

  # Ensure xclip is installed on Linux systems for the clipboard to work
  home.packages = pkgs.lib.mkIf pkgs.stdenv.isLinux [
    pkgs.xclip
  ];
}
