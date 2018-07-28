source ./script_register_queries.bash

respaldos_path="/media/sf_shared_host_folder/respaldos"

mkdir -p $respaldos_path

current_date=$(date +"%Y_%m_%d")
current_time=$(date +"%H:%M:%S")

directories="/etc /home /var/lib"

tar -czf $respaldos_path/respaldo_$current_date.tar.gz $directories

stat=$(echo $?)

if [ "$stat" = "0" ]
then
	echo "success - $current_date $current_time - respaldo_$current_date.tar.gz " >> /var/log/mis_respaldos.txt
else
	echo "El respaldo no fue completado con exito, por favor vuelva a intentarlo"
	echo "error - $current_date $current_time - error_respaldo_$current_date"  >> /var/log/mis_respaldos.txt
	mv $respaldos_path/respaldo_$current_date.tar.gz $respaldos_path/error_respaldo_$current_date.tar.gz
fi	

registerQuery "script_generate_backup"
