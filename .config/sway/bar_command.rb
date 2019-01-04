#!/bin/env ruby

require 'date'
require 'json'

# Regex: /^(name)\s+(uuid)\s+(type)\s+(device)/
network_regex_prefix = '(.+?):([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})'
network_regex_wifi = /^#{network_regex_prefix}:802-11-wireless:wlp3s0$/
network_regex_eth  = /^#{network_regex_prefix}:802-3-ethernet:enp0s25$/
network_regex_vpn  = /^#{network_regex_prefix}:vpn:\w*?$/

def json(name, text, color = '#ffffff')
  "{\"name\":\"#{name}\",\"color\":\"#{color}\",\"full_text\":\"#{text}\"},"
end

# Start json protocol output
puts '{"version":1}'
puts '['
puts '[]'

while true do
  #
  # Date
  #
  date = DateTime.now.strftime('%F %T')

  #
  # Battery
  #
  battery_data = %x(upower --show-info /org/freedesktop/UPower/devices/DisplayDevice)
  battery_percentage = battery_data[/percentage:\s+(\d{1,3}),?\d*%/, 1]
  battery_time = battery_data[/time to empty:\s+(\d+,\d+ \w+)/, 1]
  unless battery_time
    battery_time = 'charging'
  end

  #
  # Network
  #
  network_data = %x(nmcli --terse connection show --active)
  # - WiFi
  wifi_name = network_data[network_regex_wifi, 1]
  # - Ethernet
  if network_data[network_regex_eth, 1]
    eth_status = 'connected'
  else
    eth_status = 'none'
  end
  # - VPN
  if (vpn = network_data[network_regex_vpn, 1])
    vpn_status = vpn
  else
    vpn_status = 'none'
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
  # Keyboard Layout
  #
  layout_data = JSON.parse(%x(swaymsg -r -t get_inputs))
  layout = layout_data.find{ |e| e['identifier'] == '1:1:AT_Translated_Set_2_keyboard'}['xkb_active_layout_name']
  layout = layout == 'Swedish' ? 'SWE' : 'US'
  # - There are two identical values in the output of the layout_data command for my workplace keyboard.
  # - And only the last one is the correct one.
  layout_work_list = layout_data.find_all{ |e| e['identifier'] == '1118:219:Microsoft_Natural®_Ergonomic_Keyboard_4000' }
  if layout_work_list
    if layout_work_list.size > 0
      layout_work = layout_work_list.last['xkb_active_layout_name']
      layout_work = layout_work == 'Swedish' ? ',(SWE)' : ',(US)'
    else
      layout_work = ''
    end
  end

  #
  # Output
  #
  #puts "#{date} | Bat: #{battery_percentage}% (#{battery_time}) | WiFi: #{wifi_name} | Eth: #{eth_status} | Sound: #{sound_level}% (#{sound_muted}) | Screen: #{light_percentage}% "
  output = ',['
  output += json('date', date)
  output += json('battery', "Battery: #{battery_percentage}% (#{battery_time})", (battery_percentage.to_i < 20 ? '#ff0000' : '#00ff00'))
  output += json('wifi', "WiFi: #{wifi_name}", (wifi_name ? '#00ff00' : '#ff0000'))
  output += json('eth', "Eth: #{eth_status}", (eth_status == 'none' ? '#ff0000' : '#00ff00'))
  output += json('vpn', "VPN: #{vpn_status}")
  output += json('sound', "Sound: #{sound_level}%", (sound_muted == 'off' ? '#ff0000' : '#00ff00'))
  output += json('screen', "Screen: #{light_percentage}%")
  output += json('keyboard', "Keyboard: #{layout + layout_work}")
  output += ']'
  puts output

  # Sleep until the exact next second
  sleep(1 - Time.now.subsec)
end
