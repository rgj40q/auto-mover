#!/bin/bash

for disk in L M N O P Q R; do
	avail=$(( $(df --output=source,avail | grep $disk | cut -d ':' -f 2) / 1048576 ))
	if [[ $avail -gt 1 ]]; then
		size=$(( avail - 1 ))
		pwsh 'A:\RT_Pack-main\Mover.ps1' -category '' -max_1_size $size -max_size $size -id_subfolder Y -client_name client2 -min_move_days 30 -path_from 'S:\j' -path_to "$disk:\\j"
	fi
done
