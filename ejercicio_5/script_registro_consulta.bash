function registrarConsulta {
	datetime=$(date)
	echo "$USER - $datetime" >> /var/log/historial_de_respaldos.txt
}

export -f registrarConsulta
./script_logins.bash
