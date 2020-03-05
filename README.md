# Remote Transceiver notes

Based on Rasperry PI 1 B+ and Raspian Distro







## Remote serial port



We can use the library ser2net that is available on raspian repositories

Installation:

```
sudo apt-get install ser2net
```



```bash


BANNER:banner:Serial-USB Proxy Server: 4800 baud, 8, none, 2 (Elecraft K2)

4001:raw:0:/dev/ttyUSB0:4800 8DATABITS NONE 2STOPBITS banner
```





## Remote audio



Audio rpi library



jack
sudo apt-get install qjackctl

https://www.youtube.com/watch?v=aypkzE-yiTY

