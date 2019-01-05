#!/bin/bash
read -p "请输入网卡名：" b
if [ -z $1 ];then
    a=eth0
else
    a=$b
fi
setIP(){
nmcli connection modify $a ipv4.method manual ipv4.addresses $ip/24 connection.autoconnect yes
nmcli connection up $a
}
ifconfig $a | egrep "inet {1,}[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
[ $? -eq 0 ] && echo "该网卡已经有 IP 地址" && exit
while :
do
    read -p '请输入192.168.4.0网段的ip地址：' ip
    echo $ip > ./ip.txt
    grep "192.168.4.[0-9]{1,3}" ./iptxt
    [ $? -ne 0 ] && echo "非192.168.4.0网段的地址" || IP=$ip
done
setIP 
