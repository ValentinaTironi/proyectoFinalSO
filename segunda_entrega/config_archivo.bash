#function configurar_archivo {
	ruta_respaldo="/media/sf_shared_host_folder/respaldos"
	echo Ingrese la ruta absoluta del archivo
	read archivo

	echo Ingrese el nombre que le quiere poner al archivo de respaldo:
	read nombre_archivo

	echo "¿Desea comprimir el archivo a respaldar? (y/n)"
	read respuesta

	if [ $respuesta == "y" ]
	then
		tar -czvf $ruta_respaldo/$nombre_archivo.tar.gz $archivo
	elif [$resulta == "n" ]
	then
		tar -cvf $ruta_respaldo/$nombre_archivo.tar $archivo
	fi

	ls $ruta_respaldo

#}
