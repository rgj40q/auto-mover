#!/bin/bash

for disk in L M N O P R S; do
	avail=$(( $(df --output=source,avail | grep "$disk:" | cut -d ':' -f 2) / 1048576 ))
	if [[ $avail -gt 1 ]]; then
		pwsh 'A:\RT_Pack-main\Mover.ps1' -category '' -max_1_size $(($avail - 1)) -max_size $(($avail - 1)) -id_subfolder Y -client_name client1 -min_move_days 0 -path_from 'T:\r' -path_to "$disk:\\r"
	fi
done
