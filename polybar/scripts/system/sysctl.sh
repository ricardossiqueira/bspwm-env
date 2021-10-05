#!/usr/bin/env bash

handler() {
  cmd=$2;
  msg=$1;
  echo "$msg [Y/n]";
  read input;
  input=$(echo $input | tr '[:upper:]' '[:lower:]');
  if [[ $input == "y" ]]; then
    $cmd;
    exit 1;
  elif [[ $input == "n" ]]; then
    exit 0;
  else
    echo -e "Error: Invalid argument!\nExpected: \"Y\" | \"n\".\nRecieved: \"$input\".";
    handler $msg $cmd;
  fi;
}

main() {
  option=$1;
  if [[ $option == "poweroff" ]]; then
    handler "Poweroff?" "systemctl poweroff";
  elif [[ $option == "suspend" ]]; then
    handler "Suspend?" "systemctl suspend";
  fi;
}

main "$@";