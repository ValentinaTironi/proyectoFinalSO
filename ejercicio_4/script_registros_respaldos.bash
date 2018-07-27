if [ -s /var/log/mis_respaldos.txt ]
then
	echo "***Registros de respaldos creados***"
	awk -F " - " '{
		if($1 == "success"){
			print $2 " - " $3
		}
	 } ' /var/log/mis_respaldos.txt
else
	echo "No hay registro de respaldos creados"
fi

