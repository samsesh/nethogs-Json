#!/bin/bash

if command -v apt-get >/dev/null; then
apt update -y
apt-get install build-essential libncurses5-dev libpcap-dev make zip unzip git wget -y
elif command -v yum >/dev/null; then
yum update -y
yum install gcc-c++ git libpcap-devel.x86_64 libpcap.x86_64 "ncurses*"
fi
git clone https://github.com/samsesh/nethogs-Json.git /root/nethogs
chmod 744 /root/nethogs/determineVersion.sh
cd /root/nethogs/
sudo make install
hash -r
cp /usr/local/sbin/nethogs /usr/sbin/nethogs -f
rm -fr /root/nethogs /root/nethogs.zip
sudo setcap "cap_net_admin,cap_net_raw,cap_dac_read_search,cap_sys_ptrace+pe" /usr/local/sbin/nethogs
