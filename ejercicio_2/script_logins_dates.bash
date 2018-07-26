echo "Inserte fecha de comienzo (YYYY-MM-DD):"

read fecha_desde

echo "Inserte fecha de finalizacion (YYYY-MM-DD):"

read fecha_hasta

files=$(find /var/log/ | grep  wtmp)
if [ -z "$fecha_hasta" ] && [ ! -z "$fecha_desde" ]
then 
	echo "** No se ingreso fecha de finalizacion, se van a mostrar todos los registros desde la fecha $fecha_desde hasta el dia de hoy **"	
	for file in $files
	do
		last -f $file -s "$fecha_desde"
	done
elif [ -z "$fecha_desde" ] && [ ! -z "$fecha_hasta" ]
then
	echo "** No se ingreso fecha de comienzo, se van a mostrar todos los registros hasta la fecha $fecha_hasta **"
	last -t "$fecha_hasta"
	for file in $files
	do
		last -f $file -s "$fecha_hasta"
	done
elif [ -n "$fecha_hasta" ] && [ -n "$fecha_desde" ]
then
	if [[ "$fecha_desde" < "$fecha_hasta" ]]
	then	
		last_command="$(for file in $files
		do
			last -f $file -s "$fecha_desde" -t "$fecha_hasta"
		done)"
		register=$(echo "${last_command}" | grep 'reboot')
		if [ -z "$register" ]
		then
			echo "No hay registros entre la fechas $fecha_desde y $fecha_hasta"
		else
			echo "$last_command"
			echo "todo bien"
		fi	
	else
		echo "No es posible mostrar ningun registro dado a que ha ingresado incorrecamente las fechas requeridas"
	fi
fi

