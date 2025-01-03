#!/bin/sh

DEVICE=$1
PROP=$2
VAL=$3

DEFAULT="Default"

if [ "$DEVICE" = "" ]; then 
    exit 1
fi

if [ "$PROP" = "" ]; then 
    exit 1
fi

if [ "$VAL" = "" ]; then 
    exit 1
fi

devlist=$(xinput --list | grep "$DEVICE" | sed -n 's/.*id=\([0-9]\+\).*/\1/p')
echo $devlist

for dev in $devlist
do
    props=$(xinput list-props $dev | grep "$PROP" | grep -v $DEFAULT | sed -n 's/.*(\([0-9]\+\)).*/\1/p')

    for prop in $props
    do
        xinput set-prop $dev $prop $VAL 
    done 
done
