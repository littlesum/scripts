#!/bin/sh
# this is script running in openwrt, help for ddns wg interface checking! 
# if ip change wg "if" will be restart or reset!!
# you need instll bind-dig & wireguard tools!
WGIP=`dig +short yourdomain aaaa`
echo "wg ip： $WGIP"
WG3IP=[$WGIP]
echo "wg3 ip: $WG3IP"
WG=`wg show wg3 endpoints |awk '''{print $2}'`
# 由于ipv6有个特性，只要地址租期没到，以前的链接可以一直用到租期到了
# 所以这里的逻辑改成对方节点是否通，如果是ipv4 的话还是建议以ddns ip是否
# 改变为逻辑判断优先
echo "wg3 endpoint: $WG"
ping -q -c 3 10.18.0.1 
if [ "$?" = 0 ];then
	echo 'ip not change'
else
	echo '===ip change==='
	echo '===restart wg3 waiting ......==='
#	ifup wg3
	wg setconf wg3 /scripts/wg3.conf
	echo ****done****
fi
