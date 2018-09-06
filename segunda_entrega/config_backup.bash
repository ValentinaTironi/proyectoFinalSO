#!/bin/bash

function configurar_backup {
	ruta_respaldo="/media/sf_shared_host_folder/respaldos"
	mkdir -p $ruta_respaldo

	echo Ingrese la ruta absoluta del $1
	read archivo

	echo Ingrese el nombre que le quiere poner al $1 de respaldo:
	read nombre_archivo

	echo "¿Desea comprimir o empaquetar el $1 a respaldar? (c/e)"
	read respuesta
	
	if [ -f $archivo ]
	then
		if [ $respuesta == "c" ]
		then
			tar -czvf $ruta_respaldo/$nombre_archivo.tar.gz $archivo
		elif [ $respuesta == "e" ]
		then
			tar -cvf $ruta_respaldo/$nombre_archivo.tar $archivo
		else
			echo $respuesta no es una opcion valida, vuelva a intentarlo.
		fi

		echo "***Se listan todos los respaldos***"
		ls $ruta_respaldo
	else 
		echo "El archivo $archivo que intenta respladar no existe"
	fi
}
