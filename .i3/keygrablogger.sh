#!/bin/bash
KEY=XF86AudioLowerVolume
xdotool keydown ${KEY}; xdotool key XF86LogGrabInfo; xdotool keyup ${KEY}
