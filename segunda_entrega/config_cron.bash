#!/bin/bash

function valid_value {
	num='^[0-9]+$'
	if [[ $2 =~ $num ]];
	then
		if [ $2 -le $1 ]
		then
			echo $2
		else
			echo "invalid"
		fi	
	elif [[ -z $2 ]];
	then
		echo "*"
	else
		echo "invalid"
	fi
}

function configurar_cron {
	text="que se va a ejecutar la tarea"
	invalid_value="Ha ingresado un valor no valido, por favor vuelva a intentarlo: "

	echo "*** Los valores a ingresar en las siguientes opciones deben ser numericos ***"

	echo -n "Ingrese los minutos en los $text (00-59): " 
	read minutos

	minutos=$(valid_value 59 $hora)
	while [ "$minutos" = "invalid" ]
	do
		echo -n "$invalid_value"
		read minutos
		minutos=$(valid_value 23 $minutos)
	done

	echo -n "Ingrese la hora en la $text (00-23): " 
	read hora

	hora=$(valid_value 23 $hora)
	while [ "$hora" = "invalid" ]
	do
		echo -n "$invalid_value"
		read hora
		hora=$(valid_value 59 $hora)
	done

	echo -n "Ingrese el dia del mes en la $text (1-31): " 
	read dia_mes

	dia_mes=$(valid_value 31 $dia_mes)
	while [ "$dia_mes" = "invalid" ]
	do
		echo -n "$invalid_value"
		read dia_mes
		dia_mes=$(valid_value 31 $dia_mes)
	done

	echo -n "Ingrese el mes en la $text (1-12): " 
	read mes

	mes=$(valid_value 12 $mes)
	while [ "$mes" = "invalid" ]
	do
		echo -n "$invalid_value"
		read mes
		mes=$(valid_value 12 $mes)
	done

	echo -n "Ingrese el dia de la semana en la $text (1-7): "
	read dia_semana

	dia_semana=$(valid_value 7 $dia_semana)
	while [ "$dia_semana" = "invalid" ]
	do
		echo -n "$invalid_value"
		read dia_semana
		dia_semana=$(valid_value 7 $dia_semana)
	done

	echo -n "Ingrese el comando que dese programar: "
	read comando

	while [ -z "$comando" ]
	do
		echo -n "Debe ingresar un comando: "
		read comando
	done

	crontab -l > last_crontab

	echo "$minutos $hora $dia_mes $mes $dia_semana $USER $comando" >> last_crontab

	crontab last_crontab

	status=$(echo $?)

	if [ "$status" = "0" ]
	then
		echo "Tarea creada con éxito."
	else
		echo "Ha ocurrido un error, vuelve a intentarlo."
	fi
	rm last_crontab

}
