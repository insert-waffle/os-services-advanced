#!/bin/bash
INPUT=$1
OLDIFS=$IFS
IFS=';'
output_file=$2

[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read vlname netwadd mask gw range_start range_end broadcast wildcard
do
	echo "# Config for network $vlname" >> $output_file
	echo "subnet $netwadd netmask $mask {" >> $output_file
	echo "	range $range_start $range_end;" >> $output_file
	echo "	option-domain-name-servers 1.1.1.1;" >> $output_file
	echo "	option routers $gw" >> $output_file
	echo "	default-lease-time 600;" >> $output_file
	echo "	max-lease-time 7200;" >> $output_file
	echo "}" >> $output_file
	echo "" >> $output_file
	echo "" >> $output_file

done < $INPUT
IFS=$OLDIFS