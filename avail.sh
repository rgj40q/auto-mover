#!/bin/bash

gb=0

for disk in D L M N O P Q R S; do
	avail=$(( $(df --output=source,avail | grep "$disk:" | cut -d ':' -f 2) / 1048576 ))
	gb=$((gb + avail))
done

tb=$(echo $((gb * 100 / 1024)) | sed 's/..$/.&/')

echo "$gb GB = $tb TB"