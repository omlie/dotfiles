#!/usr/bin/env zsh

ICON_PADDING_RIGHT=5
echo $INFO
case ${INFO} in
"Arc")
  ICON_PADDING_RIGHT=5
  ICON=
  ;;
"Code")
  ICON_PADDING_RIGHT=4
  ICON=󰨞
  ;;
"Calendar")
  ICON_PADDING_RIGHT=3
  ICON=
  ;;
"Discord")
  ICON=󰙯
  ;;
"FaceTime")
  ICON_PADDING_RIGHT=5
  ICON=󰤙
  ;;
"Finder")
  ICON=󰀶
  ;;
"iTerm2")
  echo "hei"
  ICON=
  ;;
"kitty")
  ICON=󰄛
  ;;
"Messages")
  ICON=󰍦
  ;;
"Notion")
  ICON_PADDING_RIGHT=6
  ICON=󰈄
  ;;
"Preview")
  ICON_PADDING_RIGHT=3
  ICON=
  ;;
"Spotify")
  echo "spøt"
  ICON=
  ;;
"Telegram")
  ICON=
  ;;
"TextEdit")
  ICON_PADDING_RIGHT=4
  ICON=
  ;;
*)
  ICON=﯂
  ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
