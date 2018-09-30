#!/bin/bash

source ./config_backup.bash
source ./config_cron.bash
source ./list_crontab.bash

continuar=true

function salir {
	echo "Desea realizar alguna otra accion? (y/n)"
	read resp

	if [ $resp = "n" ]
	then
		echo "*** Hasta luego $USER ***"
		exit
	elif [ $resp = "y" ]
	then
		clear
	else
		echo No es una opcion valida, por favor vuelva a intentarlo
		salir
	fi
}

function main {
	while true; do
		echo Selecciona una de las siguientes opciones:

		echo "
		1. Configurar archivo para respaldo
		2. Configurar directorio para respaldo
		3. Configurar CRON
		4. Listar crontab del usuario
		5. Salir"

		read option

		case "$option" in
			"1")
				clear
				configurar_backup "archivo"
				salir
				;;
			"2")
				clear
				configurar_backup "directorio"
				salir
				;;
			"3")
				clear
				configurar_cron
				salir
				;;
			"4")
				clear
				list_crontab
				salir
				;;
			"5")
				salir
				;;
			*)
				echo La opción $option no está disponible, porfavor vuelva a intentarlo
				exit
		esac
	done
}

main
