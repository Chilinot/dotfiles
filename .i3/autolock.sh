#!/bin/bash

xautolock -detectsleep -time 3 -locker 'i3lock -d -c 000000' -notifier \"notify-send -t 2000 'Locking screen in 30 seconds'\"
