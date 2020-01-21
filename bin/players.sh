if [[ $(uname) == 'Linux' ]]; then
  title=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/title/{n;p}' | cut -d '"' -f 2)

  artist=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | sed -n '/Artist/{n;p;n;p}' | cut -d '"' -f 2 | sed -n -e '2{p;q}')

  echo "${title} - ${artist}"
# else
  # TODO: Implement script that solve this to OSX
fi
