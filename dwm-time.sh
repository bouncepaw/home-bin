#!/bin/bash
while :
do
    date '+%d %B %R' | xsetroot -name "$(cat /dev/stdin)"
    sleep 1
done
