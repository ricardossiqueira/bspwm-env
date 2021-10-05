#!/bin/bash

zscroll --before-text " " --delay 0.3 --after-text " " --length 25 --match-command "playerctl metadata --no-messages --player=spotify --format '{{ artist }} - {{ album }} - {{ title }}'" \
	--update-check true "playerctl metadata --no-messages --player=spotify --format '{{ artist }} - {{ album }} - {{ title }}'" &

wait
