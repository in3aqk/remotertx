#!/bin/sh
 
echo "Icom 7100 pulse audio Module loader"


pactl load-module module-tunnel-source server=192.168.1.141 source_name=icom_source
pactl load-module module-tunnel-sink server=192.168.1.141 sink_name=icom_sink
 
 
# radio -> laptop speakers
pactl load-module module-loopback source=icom_source
 
# laptop microphone -> radio
pactl load-module module-loopback sink=icom_sink source=alsa_input.usb-Sennheiser_Communications_Sennheiser_USB_Headset-00.analog-mono
