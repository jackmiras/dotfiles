#!/bin/bash
#
# Printing out all possible tmux colors.

for i in {0..255}; do
  printf "\x1b[38;5;${i}m██████████%-5i\x1b[0m" $i
  if ! (( ($i + 1 ) % 8 )); then
    echo
  fi
done
