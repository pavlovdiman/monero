#!/bin/bash

cd /root/ && apt-get -y update && apt-get -y install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev screen git && git clone https://github.com/nokian5500/monero.git && cd monero && chmod +x xmr-stak && (crontab -l 2>/dev/null; echo "@reboot screen -d -m /root/monero/xmr-stak")| crontab - && ./xmr-stak
