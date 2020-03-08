# Remote Transceiver de IN3AQK

Based on Rasperry PI 1 B+ and Raspian Distro and ICOM 7100





# Remote rig control





## Remote serial port method



We can use the library ser2net that is available on raspian repositories

Installation:

```
sudo apt-get install ser2net
```



STEP 1:  Make the port available, and create a connection banner

```bash
#modify /etc/ser2net.conf

BANNER:banner:Serial-USB Proxy Server: 19200 baud, 8, none, 2 (ICOM 7100)

4001:raw:0:/dev/ttyUSB0:19200 8DATABITS NONE 1STOPBITS banner


```



STEP 2: start the ser2net server on the RPI

```bash
ser2net -n
```



STEP 3: Start socat on the client to have the virtual port available:



```bash
# VERBOSE
sudo socat -v -d -d -d TCP4:192.168.1.141:4001 PTY,link=/dev/ttyS1,b19200,cs8,cstopb=1,parenb=0

# Without log info
sudo socat TCP4:192.168.1.141:4001 PTY,link=/dev/ttyS1,b19200,cs8,cstopb=1,parenb=0
```



STEP 4: Start Flrig or the client software to control the remote transceiver function



# Remote audio

## Pulseaudio



<https://partofthething.com/thoughts/remote-ham-radio-operation-through-a-raspberry-pi/>



```bash
sudo apt-get install pulseaudio pulseaudio-module-jack pulseaudio-utils pulseaudio-module-zeroconf

sudo vi /etc/pulse/system.pa
### edit /etc/pulse/system.pa to enable networked audio 
load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1;192.168.1.0/24

# verify if in the distro pulse audio starts at boot, otherwise create a service 
# following this guide https://www.raspberrypi.org/forums/viewtopic.php?t=156120
```



# Pulse audio useful commands

```bash
# list of all loaded modules
pactl list short modules

#unload a module by id
pactl unload-module <module id> # get it with pactl list

#unload all....  
pulseaudio -k

```



# ICOM 7100 settings

These are the settings for the Icom 7100

Connectors > Usb audio sql > ON









# TODO


Audio rpi library



jack
sudo apt-get install qjackctl

https://www.youtube.com/watch?v=aypkzE-yiTY





# Credits

Network Transceiver Operation

<http://alloutput.com/amateur-radio/remote-transceiver-operation/>



Remote ham radio operation through a Raspberry Pi

<https://partofthething.com/thoughts/remote-ham-radio-operation-through-a-raspberry-pi/>







