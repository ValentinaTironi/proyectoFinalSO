
respaldos_path="/media/sf_shared_host_folder/respaldos"

mkdir -p $respaldos_path

current_date=$(date +"%Y_%m_%d")

directories="/etc /home /var/lib"

tar -czvf $respaldos_path/respaldo_$current_date.tar.gz $directories

echo "El respaldo se hizo correctamente en la fecha $current_date" >> /var/log/mis_respaldos.txt 
