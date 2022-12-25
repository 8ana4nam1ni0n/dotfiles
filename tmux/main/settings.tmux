set-option -g default-terminal 'tmux-256color'
set-option -sa terminal-overrides ',xterm-256color:RGB'

set -s escape-time 0

# Sets focus events
set-option -g focus-events on

# settings for tmux
unbind C-b

# Custom Prefix
set -g prefix C-a

# History Limit
set-option -g history-limit 5000

# Window/Pane Numbering Index of Base 1
set -g base-index 1
setw -g pane-base-index 1 

# Window Re-Numbering on close
set -g renumber-windows on

# Prevent Auto-Renaming Windows
set -g allow-rename off

set-window-option -g mode-keys vi
# set -g status-style 'bg=#333333 fg=#5eacd3'

