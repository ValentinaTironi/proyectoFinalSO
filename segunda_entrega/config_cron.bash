#!/bin/bash

function change_value_if_empty {
	if [ -z $1 ]
	then
		echo "*"
	else
		echo $1
	fi
}

function configurar_cron {
	text="que se va a ejecutar la tarea"
	echo "*** Los valores a ingresar en las siguientes opciones deben ser numericos ***"

	echo Ingrese la hora en la $text
	read hora

	echo Ingrese los minutos en los $text
	read minutos

	echo Ingrese el dia del mes en la $text
	read dia_mes

	echo Ingrese el mes en la $text
	read mes

	echo Ingrese el dia de la semana en la $text
	read dia_semana

	echo Ingrese el comando que dese programar
	read comando

	hora=$(change_value_if_empty $hora)
	minutos=$(change_value_if_empty $minutos)
	dia_mes=$(change_value_if_empty $dia_mes)
	mes=$(change_value_if_empty $mes)
	dia_semana=$(change_value_if_empty $dia_semana)

	crontab -l > last_crontab

	echo "$hora $minutos $dia_mes $mes $dia_semana $USER $comando" >> last_crontab

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
