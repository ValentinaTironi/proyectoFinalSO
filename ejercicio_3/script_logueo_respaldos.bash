respaldos_path="/media/sf_shared_host_folder/respaldos"

mkdir -p $respaldos_path

current_day=$(date +"%Y_%m_%d")

directories="/etc /home /var/lib"
echo $current_day

tar -czvf $respaldos_path/respaldo_$current_day.tar.gz $directories
