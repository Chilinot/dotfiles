#!/bin/env ruby

require 'date'

# Regex: /^(name)\s+(uuid)\s+(type)\s+(device)/
network_regex_prefix = '([\w -]*[\w-]+)\s+([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})\s+(\w+)\s+'
network_regex_wifi = /#{network_regex_prefix}wlp3s0/
network_regex_eth  = /#{network_regex_prefix}enp0s25/

while true do
  #
  # Date
  #
  date = DateTime.now.strftime('%F %T')

  #
  # Battery
  #
  battery_data = %x(upower --show-info /org/freedesktop/UPower/devices/DisplayDevice)
  battery_percentage = battery_data[/percentage:\s+(\d{1,2}),\d+%/, 1]
  battery_time = battery_data[/time to empty:\s+(\d+,\d+ \w+)/, 1]
  unless battery_time
    battery_time = 'charging'
  end

  #
  # Network
  #
  network_data = %x(nmcli connection show --active)
  # - WiFi
  wifi_name = network_data[network_regex_wifi, 1]
  # - Ethernet
  if network_data[network_regex_eth, 1]
    eth_status = 'connected'
  else
    eth_status = 'none'
  end

  #
  # Sound
  #
  sound_data = %x(amixer scontents)
  sound_regex = /Front Left: Playback \d+ \[(\d{1,2})%\] \[(on|off)\]/
  # - Grab contents for left speaker, they're set symmetrically, so it doesn't matter:
  sound_level = sound_data[sound_regex, 1]
  sound_muted = sound_data[sound_regex, 2]

  #
  # Screen Backlight
  #
  light_data = %x(brightnessctl -c 'backlight' -m)
  light_regex = /\w+,backlight,\d+,(\d{1,2})%,\d+/
  light_percentage = light_data[light_regex, 1]

  #
  # Output
  #
  puts "#{date} | Bat: #{battery_percentage}% (#{battery_time}) | WiFi: #{wifi_name} | Eth: #{eth_status} | Sound: #{sound_level}% (#{sound_muted}) | Screen: #{light_percentage}% "

  # Sleep 1 second
  sleep(1)
end
