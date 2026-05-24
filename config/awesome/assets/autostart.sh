#!/usr/bin/env bash
# Ashlyn AwesomeWM autostart
set -u

run_once() {
  local process="$1"; shift
  if ! pgrep -x "$process" >/dev/null 2>&1; then
    "$@" >/dev/null 2>&1 &
  fi
}

run_once picom picom --config "$HOME/.config/picom/picom.conf"
run_once nm-applet nm-applet
command -v blueman-applet >/dev/null 2>&1 && run_once blueman-applet blueman-applet
command -v udiskie >/dev/null 2>&1 && run_once udiskie udiskie --tray
command -v flameshot >/dev/null 2>&1 && run_once flameshot flameshot
command -v playerctld >/dev/null 2>&1 && run_once playerctld playerctld daemon

# Restore wallpaper if feh is installed; Awesome still handles wallpaper internally.
command -v feh >/dev/null 2>&1 && feh --bg-fill "$HOME/.config/awesome/assets/wallpaper.png" >/dev/null 2>&1 &
