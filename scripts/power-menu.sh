#!/bin/bash

# Power menu using rofi
options="Shutdown\nReboot\nSuspend\nHibernate\nLock\nLogout"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme-str 'window {width: 250px;}')

case "$chosen" in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Suspend) systemctl suspend ;;
    *Hibernate) systemctl hibernate ;;
    *Lock) swaylock -f -c 000000 ;;
    *Logout) swaymsg exit ;;
esac