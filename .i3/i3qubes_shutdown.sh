#!/bin/bash

# Shutting down all VM's before attempting to shutdown the OS has proven to be more reliable.
# If the OS is shutdown prior to VM's, it has a tendency to lock itself in a "limbo" state.

# Shutdown all VM's and wait until they are all down.
qvm-shutdown --all --wait

# Shutdown operating system ignoring any inhibitor locks.
systemctl poweroff --ignore-inhibitors 
