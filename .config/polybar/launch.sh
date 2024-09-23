#!/bin/sh
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown
#
# echo "Bars launched..."

# polybar-msg cmd quit
#
# # polybar main
# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload main &
#   done
# else
#   polybar --reload main &
# fi

polybar-msg cmd quit

BAR_NAME=main
BAR_CONFIG=/home/$USER/.config/polybar/config.ini

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

if [ $PRIMARY ]; then
  # Launch on primary monitor
  MONITOR=$PRIMARY polybar --reload -c $BAR_CONFIG $BAR_NAME &

  sleep 1
fi

# Launch on all other monitors
for m in $OTHERS; do
 MONITOR=$m polybar --reload -c $BAR_CONFIG $BAR_NAME &
 echo $MONITOR
done
