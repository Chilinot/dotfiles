#!/bin/bash
if bluetoothctl <<< "show" | grep "Powered: no" ; then
    bluetoothctl <<< "power on" ;
else
    bluetoothctl <<< "power off" ;
fi
