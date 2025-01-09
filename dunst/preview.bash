#!/bin/env bash

killall dunst
sleep 0.2
dunst -conf ~/.config/sway/dunst/config &
echo "Reload Dunst, Previewing notification..."


notify-send -u low -h string:x-dunst-stack-tag:preview_low "Title" "Example &amp; More";
notify-send -u normal -h string:x-dunst-stack-tag:preview_normal "Title" "Example &amp; More";

notify-send --action "replyAction,reply" -u normal -h string:x-dunst-stack-tag:preview_normal_action "Action" "Click for replying";

progress_bar() {
  notify-send --action "open,Open" -u critical -h string:x-dunst-stack-tag:preview_crit_action "Action" "Click for processing";
  for i in $(seq 1 100); do
    sleep 0.01
    dunstify -u normal -h int:value:$i "Test" "Progress_bar ..."
  done
}
progress_bar 

exit 0
