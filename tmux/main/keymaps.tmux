# Tmux Keymaps

bind C-a send-prefix

# Vertical Split
bind-key "|" split-window -h -c "#{pane_current_path}"
bind-key "\\" split-window -fh -c "#{pane_current_path}"

# Horizontal Split
bind-key "-" split-window -v -c "#{pane_current_path}"
bind-key "_" split-window -fv -c "#{pane_current_path}"

# New window keeps current path
bind c new-window -c "#{pane_current_path}"

# Reload config
bind r source-file ~/.config/tmux/tmux.conf \; display "tmux.conf reloaded!"

# Toggle between last window and current
bind-key Space last-window

# HJKL Pane Traversal
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Resize pane
bind -r C-h resize-pane -L 5
bind -r C-j resize-pane -D 5
bind -r C-k resize-pane -U 5
bind -r C-l resize-pane -R 5

# Copy Paste Selection
bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -sel clip'
