echo "Inserte fecha de comienzo (YYYY-MMM-DD):"

read fecha_desde

echo "Inserte fecha de finalizacion (YYYY-MMM-DD):"

read fecha_hasta

if [ -z "$fecha_hasta" ]
then 
	echo "** No se ingreso fecha de finalizacion, se van a mostrar todos los registros desde la fecha $fecha_desde hasta el dia de hoy **"	
	last -s "$fecha_desde"
elif [ -z "$fecha_desde" ]
then
	echo "** No se imgreso fecha de comienzo, se van a mostrar todos los registros hasta la fecha $fecha_hasta **"
	last -t "$fecha_hasta"
fi


