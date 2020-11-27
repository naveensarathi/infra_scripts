#!/bin/bash
# Script to setup Host name and IP address on new Ubuntu linux 
# ver1.0
if [ "$#" -ne 2 ]
then
        echo "Usage: ./set_up.sh HOSTNAME IP_ADDRESS"

else
wh='\033[0;97m'
br1='\033[0;32m'
br2='\033[0;91m'
NC='\033[0m'
echo -e "\t\t\tHOSTNAME: $wh$1$NC \n\t\t\tIP:$wh$2$NC \n\t\tHit$br1 Any$NC key to continue or $br2^c$NC to cancle "
read
hostnamectl set-hostname $1
sed "s/192.168.5.237/$2/g" /etc/netplan/50-cloud-init.yaml > /etc/netplan/50-cloud-init.tmp
#cat /etc/netplan/50-cloud-init.tmp
cp /etc/netplan/50-cloud-init.tmp /etc/netplan/50-cloud-init.yaml

fi
