# Base16 Styling Guidelines:
# base00 - Default Background
# base01 - Lighter Background (Used for status bars)
# base02 - Selection Background
# base03 - Comments, Invisibles, Line Highlighting
# base04 - Dark Foreground (Used for status bars)
# base05 - Default Foreground, Caret, Delimiters, Operators
# base06 - Light Foreground (Not often used)
# base07 - Light Background (Not often used)
# base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
# base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
# base0A - Classes, Markup Bold, Search Text Background
# base0B - Strings, Inherited Class, Markup Code, Diff Inserted
# base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
# base0D - Functions, Methods, Attribute IDs, Headings
# base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed

base00=default   # #000000
base01=colour237 # #3A3A3A
base02=colour19  # #0000AF
base03=colour8   # #002B36
base04=colour15  # #FDF6E3
base05=colour7   # #EEE8D5
base06=colour21  # #0000FF
base07=colour15  # #FDF6E3
base08=colour01  # #DC322F
base09=colour208 # #FF8700
base0A=colour3   # #B58900
base0B=colour2   # #859900
base0C=colour77  # #5FD75F
base0D=colour35  # #00AF5F
base0E=colour97  # #875FAF
base0F=colour17  # #00005F

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 3

# default statusbar colors
set-option -g status-style fg=$base02
set-option -g status-style bg=$base01

set-window-option -g window-status-style fg=$base04
set-window-option -g window-status-style bg=$base00
set -g window-status-format " #I #W"

# active window title colors
set-window-option -g window-status-current-style fg=$base01
set-window-option -g window-status-current-style bg=$base0C
set-window-option -g window-status-current-format " #[bold]#W "

# pane border colors
set-window-option -g pane-border-style fg=$base03
set-window-option -g pane-active-border-style fg=$base0C

# message text
set-option -g message-style bg=$base00
set-option -g message-style fg=$base0C

# pane number display
set-option -g display-panes-active-colour $base0C
set-option -g display-panes-colour $base01

# clock
set-window-option -g clock-mode-colour $base0C

tm_session_name="#[$base00,bg=$base0E,fg=$base01] #S "
set -g status-left "$tm_session_name"

tm_players="#[bg=$base0D,fg=$base01] ♫ #(~/Projects/dotfiles/tmux-config/bin/players.sh)"
tm_date="#[bg=$base09,fg=$base01]%H:%M:%S"
tm_battery="#[fg=$base01,bg=$base09] #(~/Projects/dotfiles/tmux-config/bin/battery-indicator.sh)"
tm_host="#[fg=$base01,bg=$base0E] #h "

set -g status-right "$tm_players $tm_battery $tm_date $tm_host"
