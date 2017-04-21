#!/bin/bash
# By @minad and @SietsevanderMolen

WIFI_VM="sys-net"

json() {
    if [[ -n "$3" ]]; then
        echo -n "{\"name\":\"$1\",\"color\":\"$3\",\"full_text\":\"$2\"},"
    else
        echo -n "{\"name\":\"$1\",\"full_text\":\"$2\"},"
    fi
}

status_net() {
    local net=$(qvm-run $WIFI_VM -p 'iwconfig; ifconfig' 2>/dev/null)
    local ssid=$(echo "$net" | perl -ne 'print $1 if /ESSID:"(.*)"/')
    if [[ -n $ssid ]]; then
        local quality=$(echo "$net" | perl -ne 'print "$1 " if /Quality=([^ ]+)/')
        json wifi "W: $quality$ssid"
    fi
    local ip=$(echo "$net" | perl -ne 'if (/^[w|e]/../^$/) { print "$1 " if /inet ([^ ]+)/ }')
    [[ -n $ip ]] && json ip "I: $ip"
}

status_time() {
    local time=$(date '+%F %T')
    echo -n "{\"name\":\"time\",\"full_text\":\"$time\"}" # last entry
}

status_bat() {
    local bat0_now=$(cat /sys/class/power_supply/BAT0/energy_now 2>/dev/null)
    local bat0_full=$(cat /sys/class/power_supply/BAT0/energy_full_design 2>/dev/null)
    local bat1_now=$(cat /sys/class/power_supply/BAT1/energy_now 2>/dev/null)
    local bat1_full=$(cat /sys/class/power_supply/BAT1/energy_full_design 2>/dev/null)

    if [[ -n "$bat1_full" && -n "$bat0_full" ]]; then
	# Multiply with 50 because one battery defines 50% of the total capacity.
        local bat=$((50*bat0_now/bat0_full+50*bat1_now/bat1_full))

	# It would seem the batteries in the Thinkpad T450 doesn't report the time left.
	# TODO: Find new method of calculating time left.
	#local tleft=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "to\ empty" | awk '{print $4 " " $5}')
	local tleft=''
        local ac=''
        local color='#00ff00'
        if [[ $(cat /sys/class/power_supply/AC/online) == '1' ]]; then
            ac=' AC'
            #tleft=''
        elif ((bat < 25)); then
            color='#ff0000'
        elif ((bat < 50)); then
            color='#ffff00'
        fi

        json bat "B: $bat%$ac $tleft" "$color"
    fi
}

status_load() {
    local load=$(uptime)
    load=${load/#*load average: }
    load=${load%,*,*}
    json load "$load"
}

status_qubes() {
    local qubes=$(qvm-ls 2>/dev/null | grep ' \* ' | wc -l)
    local total_qubes=$(qvm-ls --raw-list 2>/dev/null | wc -l)
    json qubes "$qubes / $total_qubes Q"
}

status_disk() {
    local disk=`df -h / | tail -n 1 | awk '{print "[Disk] Free: " $4 ", Usage: " $5}'`
    json disk "$disk"
}

main() {
    echo '{"version":1}'
    echo '['
    echo '[]'
    local n
    for ((n=0; ; ++n)); do
        if (( n % 10 == 0 )); then
            local qubes=$(status_qubes)
            local net=$(status_net)
            local disk=$(status_disk)
            local bat=$(status_bat)
            local load=$(status_load)
        fi
        local time=$(status_time)
        echo ",[$qubes$net$disk$bat$load$time]"
        sleep 1
    done
}

main

