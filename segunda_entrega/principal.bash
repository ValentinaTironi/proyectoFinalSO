#!/bin/bash

source ./config_backup.bash
source ./config_cron.bash
source ./list_crontab.bash

echo Selecciona una de las siguientes opciones:

echo "
1. Configurar archivo para respaldo
2. Configurar directorio para respaldo
3. Configurar CRON
4. Listar crontab del usuario"

read option

case "$option" in
	"1")
		configurar_backup "archivo"
		;;
	"2")
		configurar_backup "directorio"
		;;
	"3")
		configurar_cron
		;;
	"4")
		list_crontab
		;;
	*)
		echo La opción $option no está disponible, porfavor vuelva a intentarlo
		exit
esac
