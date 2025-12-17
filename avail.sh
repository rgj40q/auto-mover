#!/bin/bash

while true; do

gb=0

for disk in L M N O P S T; do
	avail=$(( $(df --output=source,avail | grep "$disk:" | cut -d ':' -f 2) / 1048576 ))
	gb=$((gb + avail))
done

tb=$(echo $((gb * 100 / 1024)) | sed 's/..$/.&/')

echo "$(date +%H:%M:%S) $gb GB = $tb TB"

sleep 5
done