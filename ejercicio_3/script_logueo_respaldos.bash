
respaldos_path="/media/sf_shared_host_folder/respaldos"

mkdir -p $respaldos_path

current_date=$(date +"%Y_%m_%d")
current_time=$(date +"%H:%M:%S")

directories="/etc /home /var/lib"

tar -czf $respaldos_path/respaldo_$current_date.tar.gz $directories

stat=$(echo $?)

if [ "$stat" = "0" ]
then
	echo "success - El respaldo se hizo correctamente - $current_date $current_time" >> /var/log/mis_respaldos.txt
else
	echo "El respaldo no fue completado con exito, por favor vuelva a intentarlo"
	echo "error - El respaldo no fue completado con éxito - $current_date $current_time" >> /var/log/mis_respaldos.txt
	mv $respaldos_path/respaldo_$current_date.tar.gz $respaldos_path/error_respaldo_$current_day.tar.gz
fi	
