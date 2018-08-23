function registerQuery {
	datetime=$(date)
	echo "$USER - $datetime - $1" >> /var/log/historial_de_respaldos.txt
}
