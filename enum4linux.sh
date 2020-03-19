#!/bin/bash
if [ "$1" == "" ]
then
	echo "Usage $0 [file of ips]"
	echo " example: $0 ips.txt"
else
	for x in $(cat $1); do
		enum4linux -a $x > $x"--enum4linux.out" &
done
fi}
