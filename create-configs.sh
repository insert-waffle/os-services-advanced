#!/bin/bash
INPUT=$1
OLDIFS=$IFS
IFS=';'
mkdir config-files

[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read vlname netwadd mask gw range_start range_end broadcast wildcard
do
	touch config-files/ifcfg-vlan$vlname
	echo "IPADDR='$gw'" >> config-files/ifcfg-vlan$vlname
	echo "NAME='$vlname'" >> config-files/ifcfg-vlan$vlname
	echo "BOOTPROTO='static'" >> config-files/ifcfg-vlan$vlname
	echo "STARTMODE='auto'" >> config-files/ifcfg-vlan$vlname
	echo "ZONE=''" >> config-files/ifcfg-vlan$vlname
	echo "ETHERDEVICE='eth0'" >> config-files/ifcfg-vlan$vlname
	echo "VLAN_ID='$vlname'" >> config-files/ifcfg-vlan$vlname
done < $INPUT
IFS=$OLDIFS