#!/bin/bash

#function configurar_cron {
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
	
	variables=($hora $minutos $dia_mes $mes $dia_semana)
	for ((i=0; i<${$variables[*]}; i++)); do
		if [ -z $variables[$i] ]
		then
			$variables[$i]="*"
		fi
		echo $variables[$i]
	done
#}
