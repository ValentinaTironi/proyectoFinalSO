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
	
	echo "$hora $minutos $dia_mes $mes $dia_semana $USER $comando" >> /etc/crontab
}
