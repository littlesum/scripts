#!/bin/sh
# this is wg checking ipv4 version

WGIP=`dig +short yourdomian.com a`
echo $WGIP
PORT=51820 # your wg listen port
WG=`wg show wg0 endpoints |awk '''{print $2}'`
echo $WG
if [ "$WG" = "$WGIP":$PORT ];then
	echo 'ip not change'
else
	echo 'ip changed'
	echo 'restart wg0'
	echo 'waiting ......'
	ifup wg0
fi

