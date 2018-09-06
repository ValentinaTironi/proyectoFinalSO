#!/bin/bash

function list_crontab {
	crontab="/etc/crontab"
	if [ -f  $crontab ]
	then
		cat $crontab
	else
		echo "No existe el archivo $cronta"
	fi
}
