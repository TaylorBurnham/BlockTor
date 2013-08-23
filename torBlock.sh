#!/bin/bash
# The purpose of this script is to
# block all TOR exit nodes via IP tables.
# The list is automatically generated.
#
# I strongly suggest you check out the
# README prior to using this.
publicIP=$(curl -s ifconfig.me)


for i in $(wget https://check.torproject.org/cgi-bin/TorBulkExitList.py\?ip=$publicIP -O- -q |\
	grep -v "#"); do
	iptables -v -A INPUT -s "$i" -j DROP
done
