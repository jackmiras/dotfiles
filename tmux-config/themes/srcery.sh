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
base02=colour19  # #011FAF
base03=colour8   # #686868
base04=colour15  # #FFFFFF
base05=colour7   # #C7C7C7
base06=colour21  # #0433FF
base07=colour15  # #FFFFFF
base08=colour01  # #C91B01
base09=colour9   # #FF6E67
base0A=colour3   # #C7C401
base0B=colour2   # #00C300
base0C=colour37  # #04FCFF
base0D=colour37  # #00AFAF
base0E=colour224 # #FFD7D7
base0F=colour17  # #010C5F


#1C1B19	28, 27, 25
#EF2F27	239, 47, 39
#519F50	81, 159, 80
#FBB829	251, 184, 41
#2C78BF	44, 120, 191
#E02C6D	224, 44, 109
#0AAEB3	10, 174, 179
#918175	145, 129, 117
#2D2C29	45, 44, 41
#F75341	247, 83, 65
#98BC37	152, 188, 55
#FED06E	254, 208, 110
#68A8E4	104, 168, 228
#FF5C8F	255, 92, 143
#FF6E67
#53FDE9	83, 253, 233
#FCE8C3	252, 232, 195

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 3

# default statusbar colors
set-option -g status-fg $base02
set-option -g status-bg $base01
set-option -g status-attr default

set-window-option -g window-status-fg $base04
set-window-option -g window-status-bg $base00
set -g window-status-format " #I #W"

# active window title colors
set-window-option -g window-status-current-fg $base01
set-window-option -g window-status-current-bg $base0C
set-window-option -g  window-status-current-format " #[bold]#W "

# pane border colors
set-window-option -g pane-border-fg $base03
set-window-option -g pane-active-border-fg $base0C

# message text
set-option -g message-bg $base00
set-option -g message-fg $base0C

# pane number display
set-option -g display-panes-active-colour $base0C
set-option -g display-panes-colour $base01

# clock
set-window-option -g clock-mode-colour $base0C

tm_session_name="#[$base00,bg=$base0E,fg=$base01] #S "
set -g status-left "$tm_session_name"

tm_players="#[bg=$base0D,fg=$base01] ? #(osascript -l JavaScript ~/Projects/dotfiles/applescripts/players.js)"
tm_date="#[bg=$base09,fg=$base01]%H:%M:%S"
tm_battery="#[fg=$base01,bg=$base09] #(~/Projects/dotfiles/bin/battery-indicator.sh)"
tm_host="#[fg=$base01,bg=$base0E] #h "

set -g status-right "$tm_players $tm_battery $tm_date $tm_host"
