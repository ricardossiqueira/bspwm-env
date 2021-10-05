#!/usr/bin/env bash

status=$(playerctl status --no-messages --player=spotify)

control() {
  playing=$1
  paused=$2
  if [[ $status = Playing ]]; then
    echo $playing
  elif [[ $status = Paused ]]; then
    echo $paused
  else
    echo ""
  fi
}

on_click() {
  is_running=$(ps -A | grep spotify)
  if [[ $is_running != *spotify* ]]; then
    spotify &
  else
    bspc desktop --focus ^4
  fi
}

main() {
  arg=$1;
  case $arg in prev) control 玲 玲 ;;
  play_pause) control  契 ;;
  next) control 怜 怜 ;;
  launch) on_click ;;
  *) echo err ;;
  esac
}

main "$@"
