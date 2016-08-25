#!/bin/bash

# Swedish keyboard
setxkbmap -layout se

# Replace capslock with control
setxkbmap -option ctrl:nocaps

# Clear lock
xmodmap -e "clear lock"

