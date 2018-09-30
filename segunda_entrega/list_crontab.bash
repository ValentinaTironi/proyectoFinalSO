#!/bin/bash

function list_crontab {
	echo "***Se lista el crontab del usuario $USER***"

	crontab -l
	status=$(echo $?)

	if [ "$status" != "0" ]
	then
		echo "Algo salio mal, vuelva a intentarlo."
	fi
}
