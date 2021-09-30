#!/bin/bash
INPUT=$1
OLDIFS=$IFS
IFS=';'
output_file=$2


[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read -r vlname netwadd mask gw range_start range_end broadcast wildcard
do
	echo "! Configuring VLAN $vlname" >> $output_file
	echo "vlan $vlname" >> $output_file
	echo "int vlan $vlname" >> $output_file
	echo "ip addr $range_start $mask" >> $output_file
	echo "" >> $output_file
	echo "" >> $output_file
done < $INPUT
IFS=$OLDIFS